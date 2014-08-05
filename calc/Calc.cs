using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

public interface INode
{
    double Eval(Func<string, double> convert);
}

public class Node : INode
{
    public readonly string Text;

    public Node(string text)
    {
        Text = text;
    }

    public double Eval(Func<string, double> convert)
    {
        return convert(Text);
    }
}

public class Tree : INode
{
    public readonly string Operand;
    public readonly INode Left;
    public readonly INode Right;

    public Tree(string operand, INode left, INode right)
    {
        Operand = operand;
        Left = left;
        Right = right;
    }

    public double Eval(Func<string, double> convert)
    {
        double l = Left.Eval(convert);
        double r = Right.Eval(convert);
        switch(Operand)
        {
            case "+": return l + r;
            case "-": return l - r;
            case "*": return l * r;
            case "/": return l / r;
            case "%": return l % r;
            default: throw new FormatException(Operand);
        }
    }
}

public class Cond
{
    public readonly string Operand;
    public readonly INode Left;
    public readonly INode Right;

    public Cond(string operand, INode left, INode right)
    {
        Operand = operand;
        Left = left;
        Right = right;
    }

    public bool Eval(Func<string, double> convert)
    {
        double l = Left.Eval(convert);
        double r = Right.Eval(convert);
        switch(Operand)
        {
            case "=": return l == r;
            case "==": return l == r;
            case ">=": return l >= r;
            case "<=": return l >= r;
            case "!=": return l != r;
            case "<>": return l != r;
            default: throw new FormatException(Operand);
        }
    }
}

public class If : INode
{
    public readonly Cond Condition;
    public readonly INode Left;
    public readonly INode Right;

    public If(Cond condition, INode left, INode right)
    {
        Condition = condition;
        Left = left;
        Right = right;
    }

    public double Eval(Func<string, double> convert)
    {
        return Condition.Eval(convert) ? Left.Eval(convert) : Right.Eval(convert);
    }
}

public class Lex<T> where T : class
{
    static readonly Regex tokenPattern = new Regex(@"\d+(\.\d+)?|[+-/*\(\)]|\w+|IF|,|[=><]|==|<=|>=");
    public readonly string Text;
    readonly string[] tokens;
    int pos;

    public Lex(string text)
    {
        Text = text.Replace(" ", "");
        tokens = tokenPattern.Matches(Text).Cast<Match>().Select(x => x.Value).ToArray();
        pos = 0;
    }

    public void Next()
    {
        ++pos;
    }

    public void Skip(string expect)
    {
        if(expect != Token())
        {
            throw new FormatException("expect=" + expect + " but token=" + Token() + " : " + Show());
        }
        Next();
    }

    public string Token()
    {
        return tokens[pos];
    }

    public string TokenAndNext()
    {
        string token = Token();
        Next();
        return token;
    }


    public T Try(string expect, Func<T> callback)
    {
        if(!Eof() && Token() == expect)
        {
            Next();
            return callback();
        }
        return null;
    }

    public T Try(string expect1, string expect2, Func<T> callback)
    {
        return Try(expect1, () => {
            T ret = callback();
            Skip(expect2);
            return ret;
        });
    }

    public bool Eof()
    {
        return pos >= tokens.Length;
    }

    public string Show()
    {
        return string.Format(
            "tokens='{0}' pos={1} text={2}",
            string.Join(" ", tokens),
            pos,
            Text);
    }
}

public class Parser
{
    public readonly INode Root;
    readonly Lex<INode> lex;

    public Parser(string text)
    {
        lex = new Lex<INode>(text);
        Root = exp();

        if(!lex.Eof())
        {
            throw new FormatException("parse error token=" + lex.Token() + " " + lex.Show());
        }
    }

    public string Show()
    {
        return show(Root) + " <" + lex.Show() + ">";
    }

    public string show(INode obj)
    {
        Node node = obj as Node;
        if(node != null)
        {
            return "Node(" + node.Text + ")";
        }

        Tree tree = obj as Tree;
        if(tree != null)
        {
            return string.Format(
                    "Tree({0}, {1}, {2})",
                    tree.Operand,
                    show(tree.Left),
                    show(tree.Right)
                );
        }

        If if_ = obj as If;
        if(if_ != null)
        {
            Cond c = if_.Condition;
            return string.Format(
                    "If({0} {1} {2}, {3}, {4})",
                    show(c.Left),
                    c.Operand,
                    show(c.Right),
                    show(if_.Left),
                    show(if_.Right)
                );
        }

        return "BUG";
    }

    INode exp()
    {
        INode val = term();
        return 
            lex.Try("+", () => new Tree("+", val, exp())) ??
            lex.Try("-", () => new Tree("-", val, exp())) ??
            val;
    }

    INode term()
    {
        INode val = factor();
        return
            lex.Try("*", () => new Tree("*", val, term())) ??
            lex.Try("/", () => new Tree("/", val, term())) ??
            val;
    }

    INode factor()
    {
        return
            lex.Try("IF", ")", () => cond()) ??
            lex.Try("(", ")", () => exp()) ??
            new Node(lex.TokenAndNext());
    }

    INode cond()
    {
        lex.Skip("(");
        INode left = exp();
        string operand = lex.TokenAndNext();
        INode right = exp();
        lex.Skip(",");
        INode then_true = exp();
        lex.Skip(",");
        INode then_false = exp();

        Cond cond = new Cond(operand, left, right);
        return new If(cond, then_true, then_false);
    }
}

public class Calc
{
    readonly Parser parser;
    readonly INode root;
    Dictionary<string, double> vars;

    public Calc (string text)
    {
        parser = new Parser(text);
        root = parser.Root;
    }

    public string Show()
    {
        return parser.Show();
    }

    public double Eval()
    {
        return root.Eval(double.Parse);
    }

    public double Eval(Func<string, double> convert)
    {
        return root.Eval(convert);
    }

    public double Eval(Dictionary<string, double> vars_)
    {
        vars = vars_ ?? new Dictionary<string, double>();
        return root.Eval(dictConvert);
    }

    double dictConvert(string name)
    {
        double v;
        if(double.TryParse(name, out v))
        {
            return v;
        }
        else if(vars.TryGetValue(name, out v))
        {
            return v;
        }
        else
        {
            throw new KeyNotFoundException("Not in scope '" + name + "' : " + parser.Show());
        }
    }
}

public class Demo
{
    public static void Main()
    {
        // basic
        Assert(2, "1 + 1");
        Assert(1, "4-3");
        Assert(6, "2*3");
        Assert(14, "2 + 3 * 4");
        Assert(10, "2 * 3 + 4");
        Assert(10, "(2 * 3) + 4");
        Assert(14, "2 * (3 + 4)");
        Assert(6, "1 + 2 + 3");
        Assert(24, "2 * 3 * 4");
        Assert(2.4, "1.2 + 1.2");

        // variable
        Dictionary<string, double> vars = new Dictionary<string, double>();
        vars["one"] = 1;
        vars["two"] = 2;
        Assert(6, "one + two * two + one", vars); 
        Assert(6, "1 + one + two * 2", vars); 

        // if
        Assert(1, "IF(1=1, 1, 2)");
        Assert(2, "IF(1=2, 1, 2)");

        // if + variable
        Assert(1, "IF(one=1, 1, 2)", vars);
        Assert(2, "IF(one=2, 1, 2)", vars);
        Assert(3, "IF(one=3, 1, IF(one=2, 1, 3))", vars);
        Assert(4, "IF(one=3, 1, IF(one=1, 4, 3))", vars);

        // invalid expression
        AssertEx(typeof(KeyNotFoundException), "1 ++");
        AssertEx(typeof(FormatException), "1.2.2 + 1.2");
    }

    static void Assert(double expect, string exp, Dictionary<string, double> vars=null)
    {
        Calc c = new Calc(exp);
        string tree = c.Show();
        double ret = c.Eval(vars);
        string mark = expect == ret ? "o" : "x";
        Console.WriteLine(string.Format("{0}: {1,3} = {2,-32} | {3}",
            mark,
            ret,
            exp,
            tree
        ));
    }

    static void AssertEx(Type expect, string exp, Dictionary<string, double> vars=null)
    {
        try {
            Calc c = new Calc(exp);
            c.Eval(vars);
        }
        catch(Exception e)
        {
            string mark = e.GetType() == expect ? "o" : "x";
            Console.WriteLine("{0}: {1,-38} | {2}", mark, e.GetType().Name + " = " + exp, e.Message);
            return;
        }

        throw new Exception("Not throw exception " + expect.Name + " : " + exp);
    }
}
