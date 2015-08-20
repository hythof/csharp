using BinaryPacker;
using System.IO;
using System.Threading;
using System.Collections.Generic;
using System;

namespace Rpc
{
namespace Request
{

    public enum MethodId
    {
		Add = 1,
		Change = 2,
		Echo = 3,
		Empty = 4,
		Exchange = 5,
		Get = 6,
		Ping = 7,
		Put = 8,
    }

    public class Writer
    {
        static int globalPacketId;
    	readonly BinaryPackerWriterEx w;

    	public Writer()
    	{
    		w = new BinaryPackerWriterEx();
    	}

    	public MemoryStream GetStream()
    	{
    		return w.GetStream();
    	}


        public RpcHeader RequestAdd(Int32 a, Int32 b)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
    	        w.Write(a);
    	        w.Write(b);
            }, length => new RpcHeader((int)MethodId.Add, (uint)packetId, length));
        }

        public RpcHeader RequestEcho(FullType type)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
    	        w.Write(type);
            }, length => new RpcHeader((int)MethodId.Echo, (uint)packetId, length));
        }

        public RpcHeader RequestEmpty()
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
            }, length => new RpcHeader((int)MethodId.Empty, (uint)packetId, length));
        }

        public RpcHeader RequestExchange(Item[] consume)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
    	        w.Write(consume);
            }, length => new RpcHeader((int)MethodId.Exchange, (uint)packetId, length));
        }

        public RpcHeader RequestGet()
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
            }, length => new RpcHeader((int)MethodId.Get, (uint)packetId, length));
        }

        public RpcHeader RequestPut(Item item)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            return w.Request(() => {
    	        w.Write(item);
            }, length => new RpcHeader((int)MethodId.Put, (uint)packetId, length));
        }

        public void ResponseChange(Item[] x, RpcHeader header)
        {
        	w.Response(() => w.Write(x), header);
        }

        public void ResponsePing(FullType x, RpcHeader header)
        {
        	w.Response(() => w.Write(x), header);
        }
    }

    public class Reader
    {
    	public IEnumerator<uint> Parse(Func<MemoryStream> get, BinaryPackerWriterEx w)
    	{
    		while(true)
    		{
    			yield return RpcHeader.HeaderLength;
    			var r = new BinaryPackerReaderEx(get());
    			var header = new RpcHeader(r.ReadUInt32());

    			yield return header.Length;
    			switch((MethodId)header.MethodId)
    			{
					case MethodId.Add:
				        OnAdd(r.ReadInt32());
			        	break;

					case MethodId.Echo:
				        OnEcho(r.ReadFullType());
			        	break;

					case MethodId.Exchange:
				        OnExchange(r.ReadItemArray());
			        	break;

					case MethodId.Get:
				        OnGet(r.ReadItem());
			        	break;

					case MethodId.Change:
						Item[] consume = r.ReadItemArray();
				        w.Write(OnChange(consume));
			        	break;

					case MethodId.Ping:
						FullType type = r.ReadFullType();
				        w.Write(OnPing(type));
			        	break;

					// invalid case
					default:
						throw new InvalidDataException("Invalid methodId = " + header.MethodId);
				}
    		}
    	}

		public Action<Int32> OnAdd;
		public Action<FullType> OnEcho;
		public Action<Item[]> OnExchange;
		public Action<Item> OnGet;

		public Func<Item[], Item[]> OnChange;
		public Func<FullType, FullType> OnPing;
    }

    public class BinaryPackerWriterEx : BinaryPackerWriter
    {
    	MemoryStream m;

    	public BinaryPackerWriterEx() : base(new MemoryStream())
    	{
    		m = (MemoryStream)OutStream;
    	}

    	public MemoryStream GetStream()
    	{
    		return m;
    	}

    	public RpcHeader Request(Action body, Func<uint, RpcHeader> head)
    	{
    		var before = m.Position;
    		m.Seek(RpcHeader.HeaderLength, SeekOrigin.Current);
    		body();
    		var after = m.Position;

			m.Seek(before, SeekOrigin.Begin);
    		var header = head((uint)(after - before));
    		Write(header.Request);

			m.Seek(after, SeekOrigin.Begin);
			return header;
    	}

    	public void Response(Action body, RpcHeader header)
    	{
    		var before = m.Position;
    		m.Seek(RpcHeader.HeaderLength, SeekOrigin.Current);
    		body();
    		var after = m.Position;

			m.Seek(before, SeekOrigin.Begin);
            Write(header.Response((uint)(after - before)));

			m.Seek(after, SeekOrigin.Begin);
    	}


		public void Write(Item x)
		{
            Write(x.Name);
            Write(x.Count);
		}

		public void Write(Item[] xs)
		{
		    Write7BitEncodedInt(xs.Length);
		    foreach(var x in xs)
		    {
            	Write(x);
		    }
		}

		public void Write(FullType x)
		{
            Write(x.Boollean);
            Write(x.Byte);
            Write(x.Int16);
            Write(x.Int32);
            Write(x.Int64);
            Write(x.UInt16);
            Write(x.UInt32);
            Write(x.UInt64);
            Write(x.Single);
            Write(x.Double);
            Write(x.Stirng);
            Write(x.BoolleanArray);
            Write(x.ByteArray);
            Write(x.Int16Array);
            Write(x.Int32Array);
            Write(x.Int64Array);
            Write(x.UInt16Array);
            Write(x.UInt32Array);
            Write(x.UInt64Array);
            Write(x.SingleArray);
            Write(x.DoubleArray);
            Write(x.StirngArray);
		}

		public void Write(FullType[] xs)
		{
		    Write7BitEncodedInt(xs.Length);
		    foreach(var x in xs)
		    {
            	Write(x);
		    }
		}
	}

    public class BinaryPackerReaderEx : BinaryPackerReader
    {
        public BinaryPackerReaderEx(Stream s) : base(s)
    	{
    	}

        public Item ReadItem()
        {
        	var x = new Item();
            x.Name = ReadString();
            x.Count = ReadInt32();
			return x;
        }

        public Item[] ReadItemArray()
        {
            var count = Read7BitEncodedInt();
        	var xs = new Item[count];
        	for(int i=0; i<count; ++i)
        	{
	        	var x = new Item();
                x.Name = ReadString();
                x.Count = ReadInt32();
				xs[i] = x;
        	}
			return xs;
        }

        public FullType ReadFullType()
        {
        	var x = new FullType();
            x.Boollean = ReadBoolean();
            x.Byte = ReadByte();
            x.Int16 = ReadInt16();
            x.Int32 = ReadInt32();
            x.Int64 = ReadInt64();
            x.UInt16 = ReadUInt16();
            x.UInt32 = ReadUInt32();
            x.UInt64 = ReadUInt64();
            x.Single = ReadSingle();
            x.Double = ReadDouble();
            x.Stirng = ReadString();
            x.BoolleanArray = ReadBooleanArray();
            x.ByteArray = ReadByteArray();
            x.Int16Array = ReadInt16Array();
            x.Int32Array = ReadInt32Array();
            x.Int64Array = ReadInt64Array();
            x.UInt16Array = ReadUInt16Array();
            x.UInt32Array = ReadUInt32Array();
            x.UInt64Array = ReadUInt64Array();
            x.SingleArray = ReadSingleArray();
            x.DoubleArray = ReadDoubleArray();
            x.StirngArray = ReadStringArray();
			return x;
        }

        public FullType[] ReadFullTypeArray()
        {
            var count = Read7BitEncodedInt();
        	var xs = new FullType[count];
        	for(int i=0; i<count; ++i)
        	{
	        	var x = new FullType();
                x.Boollean = ReadBoolean();
                x.Byte = ReadByte();
                x.Int16 = ReadInt16();
                x.Int32 = ReadInt32();
                x.Int64 = ReadInt64();
                x.UInt16 = ReadUInt16();
                x.UInt32 = ReadUInt32();
                x.UInt64 = ReadUInt64();
                x.Single = ReadSingle();
                x.Double = ReadDouble();
                x.Stirng = ReadString();
                x.BoolleanArray = ReadBooleanArray();
                x.ByteArray = ReadByteArray();
                x.Int16Array = ReadInt16Array();
                x.Int32Array = ReadInt32Array();
                x.Int64Array = ReadInt64Array();
                x.UInt16Array = ReadUInt16Array();
                x.UInt32Array = ReadUInt32Array();
                x.UInt64Array = ReadUInt64Array();
                x.SingleArray = ReadSingleArray();
                x.DoubleArray = ReadDoubleArray();
                x.StirngArray = ReadStringArray();
				xs[i] = x;
        	}
			return xs;
        }
    }


    public partial class Item
    {
        public String Name;
        public Int32 Count;
    }

    public partial class FullType
    {
        public Boolean Boollean;
        public Byte Byte;
        public Int16 Int16;
        public Int32 Int32;
        public Int64 Int64;
        public UInt16 UInt16;
        public UInt32 UInt32;
        public UInt64 UInt64;
        public Single Single;
        public Double Double;
        public String Stirng;
        public Boolean[] BoolleanArray;
        public Byte[] ByteArray;
        public Int16[] Int16Array;
        public Int32[] Int32Array;
        public Int64[] Int64Array;
        public UInt16[] UInt16Array;
        public UInt32[] UInt32Array;
        public UInt64[] UInt64Array;
        public Single[] SingleArray;
        public Double[] DoubleArray;
        public String[] StirngArray;
    }
}
}

