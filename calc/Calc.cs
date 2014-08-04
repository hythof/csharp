using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

public interface INode
{
    float Eval(Func<string, float> convert);
}

public class Node : INode
{
    public readonly string Text;

    public Node(string text)
    {
        Text = text;
    }

    public float Eval(Func<string, float> convert)
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

    public float Eval(Func<string, float> convert)
    {
        float l = Left.Eval(convert);
        float r = Right.Eval(convert);
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

public class Lex<T> where T : class
{
    static readonly Regex tokenPattern = new Regex(@"(\d+)|([+-/*\(\)])|(\w+)");
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

    public string Token()
    {
        return tokens[pos];
    }

    public string[] Tokens()
    {
        return tokens;
    }

    public string RestText()
    {
        return string.Join("", tokens.Skip(pos).ToArray());
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
            if(expect2 != TokenAndNext())
            {
                throw new FormatException("expect " + expect2 + " but token=" + Token() + " : " + Text);
            }
            return ret;
        });
    }

    public bool Eof()
    {
        return pos >= tokens.Length;
    }
}

public class Calc
{
    readonly INode root;
    readonly Lex<INode> lex;

    public Calc (string text)
    {
        lex = new Lex<INode>(text);
        root = exp();
    }

    public float Eval(Func<string, float> convert=null)
    {
        return root.Eval(convert ?? float.Parse);
    }

    public string Show()
    {
        return show(root) + " <" + string.Join(" ", lex.Tokens()) + ">";
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
        return lex.Try("(", ")", () => exp()) ?? new Node(lex.TokenAndNext());
    }
}

public class Demo
{
    public static void Main()
    {
        eval(2, "1 + 1");
        eval(1, "4-3");
        eval(6, "2*3");
        eval(14, "2 + 3 * 4");
        eval(10, "2 * 3 + 4");
        eval(10, "(2 * 3) + 4");
        eval(14, "2 * (3 + 4)");
        eval(6, "1 + 2 + 3");
        eval(24, "2 * 3 * 4");

        Dictionary<string, float> vars = new Dictionary<string, float>();
        vars["one"] = 1;
        vars["two"] = 2;
        eval(6, "one + two * two + one", token => vars[token]); 
        eval(0, "1 ++");
        eval(0, "1 2");
    }

    static void eval(float expect, string exp, System.Func<string, float> convert=null)
    {
        Calc c = new Calc(exp);
        string err = string.Empty;
        float a = 0;
        try {
            a = c.Eval(convert);
        } catch(FormatException e)
        {
            err = e.Message + " : " + e.GetType().Name + "\n--";
        }
        string t = expect == a ? "o" : "x";
        Console.WriteLine(string.Format("{0}: {1,3} = {2,-22} {3} {4}",
            t,
            a,
            exp,
            c.Show(),
            err
        ));
    }
}
