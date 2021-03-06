﻿

















using BinaryPacker;
using System.IO;
using System.Threading;
using System.Collections.Generic;
using System.Text;
using System;

namespace Rpc
{
namespace Sender
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
        public readonly MemoryStream Stream;
    	readonly BinaryPackerWriterEx w;

    	public Writer()
    	{
    		Stream = new MemoryStream();
    		w = new BinaryPackerWriterEx(Stream);
    	}



        public RpcHeader RequestAdd(Int32 a, Int32 b)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

    	        w.Write(a);

    	        w.Write(b);

            }, length => new RpcHeader((int)MethodId.Add, (uint)packetId, length));

            return header;
        }


        public RpcHeader RequestEcho(FullType type)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

    	        w.Write(type);

            }, length => new RpcHeader((int)MethodId.Echo, (uint)packetId, length));

            return header;
        }


        public RpcHeader RequestEmpty()
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

            }, length => new RpcHeader((int)MethodId.Empty, (uint)packetId, length));

            return header;
        }


        public RpcHeader RequestExchange(Item[] consume)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

    	        w.Write(consume);

            }, length => new RpcHeader((int)MethodId.Exchange, (uint)packetId, length));

            return header;
        }


        public RpcHeader RequestGet()
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

            }, length => new RpcHeader((int)MethodId.Get, (uint)packetId, length));

            return header;
        }


        public RpcHeader RequestPut(Item item)
        {
            var packetId = Interlocked.Increment(ref globalPacketId);
            var header = w.Request(() => {

    	        w.Write(item);

            }, length => new RpcHeader((int)MethodId.Put, (uint)packetId, length));

            return header;
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
		const int defaultBufferSize = 10 * 1024;
		public byte[] Buffer;
    	public readonly MemoryStream Stream;
    	BinaryPackerReaderEx r;

    	public Reader(int bufferSize=defaultBufferSize)
    	{
			Buffer = new byte[bufferSize];
    		Stream = new MemoryStream(Buffer);
    	    r = new BinaryPackerReaderEx(Stream);
    	}

    	public RpcHeader ReadHeader()
    	{
#if DEBUG
			assert(RpcHeader.HeaderLength, "RpcHeader");
#endif
			return new RpcHeader(r.ReadUInt64());
		}

    	public Action<Writer> Dispatch(RpcHeader header)
    	{
#if DEBUG
			assert(header.Length, "RpcBody " + (MethodId)header.MethodId);
#endif

			switch((MethodId)header.MethodId)
			{

				case MethodId.Add:
			        return _ => OnAdd(r.ReadInt32());


				case MethodId.Echo:
			        return _ => OnEcho(r.ReadFullType());


				case MethodId.Exchange:
			        return _ => OnExchange(r.ReadItemArray());


				case MethodId.Get:
			        return _ => OnGet(r.ReadItem());



				case MethodId.Change:

					Item[] consume = r.ReadItemArray();


			        return w => w.ResponseChange(OnChange(consume), header);



				case MethodId.Ping:

					FullType type = r.ReadFullType();


			        return w => w.ResponsePing(OnPing(type), header);



				default:
					return null;
    		}
    	}


		public Action<Int32> OnAdd;

		public Action<FullType> OnEcho;

		public Action<Item[]> OnExchange;

		public Action<Item> OnGet;



		public Func<Item[], Item[]> OnChange;

		public Func<FullType, FullType> OnPing;


#if DEBUG
    	void assert(uint need, string name)
    	{
			var rest = Stream.Length - Stream.Position;
			if(rest < need)
			{
				var msg = string.Format("{0} is not enough size need={1} but rest={2} pos={3}",
					name,
					need,
					rest,
					Stream.Position);
				throw new InvalidDataException(msg);
			}
    	}
#endif
    }

    public class BinaryPackerWriterEx : BinaryPackerWriter
    {
    	MemoryStream m;

    	public BinaryPackerWriterEx(MemoryStream s): base(s)
    	{
    		m = s;
    	}

    	public RpcHeader Request(Action body, Func<uint, RpcHeader> head)
    	{
    		var before = m.Position;
    		m.Position += RpcHeader.HeaderLength;
    		body();
    		var after = m.Position;

    		m.Position = before;
    		var header = head((uint)(after - before - RpcHeader.HeaderLength));
    		Write(header.Request);

    		m.Position = after;
			return header;
    	}

    	public void Response(Action body, RpcHeader header)
    	{
    		var before = m.Position;
    		m.Seek(RpcHeader.HeaderLength, SeekOrigin.Current);
    		body();
    		var after = m.Position;

			m.Seek(before, SeekOrigin.Begin);
            Write(header.Response((uint)(after - before - RpcHeader.HeaderLength)));

			m.Seek(after, SeekOrigin.Begin);
    	}



		public void Write(Item x)
		{
			if(x != null)
			{
				Write((Byte)1);

	            Write(x.Name);

	            Write(x.Count);

			}
			else
			{
				Write((Byte)0);
			}
		}


		public void Write(FullType x)
		{
			if(x != null)
			{
				Write((Byte)1);

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

	            Write(x.EnumValue);

	            Write(x.Item);

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

	            Write(x.EnumValueArray);

	            Write(x.ItemArray);

			}
			else
			{
				Write((Byte)0);
			}
		}



		public void Write(EnumType x)
		{
            Write((Byte)x);
		}



		public void Write(Item[] xs)
		{
			if(xs != null)
			{
				Write7BitEncodedInt(xs.Length);
				foreach(var x in xs)
				{
					Write(x);
				}
			}
			else
			{
				Write7BitEncodedInt(0);
			}
		}

		public void Write(FullType[] xs)
		{
			if(xs != null)
			{
				Write7BitEncodedInt(xs.Length);
				foreach(var x in xs)
				{
					Write(x);
				}
			}
			else
			{
				Write7BitEncodedInt(0);
			}
		}

		public void Write(EnumType[] xs)
		{
			if(xs != null)
			{
				Write7BitEncodedInt(xs.Length);
				foreach(var x in xs)
				{
					Write(x);
				}
			}
			else
			{
				Write7BitEncodedInt(0);
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
			var isNull = ReadByte() == 0;
			if(isNull)
			{
				return null;
			}

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
			var isNull = ReadByte() == 0;
			if(isNull)
			{
				return null;
			}

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

            x.EnumValue = ReadEnumType();

            x.Item = ReadItem();

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

            x.EnumValueArray = ReadEnumTypeArray();

            x.ItemArray = ReadItemArray();

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

                x.EnumValue = ReadEnumType();

                x.Item = ReadItem();

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

                x.EnumValueArray = ReadEnumTypeArray();

                x.ItemArray = ReadItemArray();

				xs[i] = x;
        	}
			return xs;
        }



        public EnumType ReadEnumType()
		{
			return (EnumType)ReadByte();
		}

		public EnumType[] ReadEnumTypeArray()
		{
            var count = Read7BitEncodedInt();
        	var xs = new EnumType[count];
        	for(int i=0; i<count; ++i)
        	{
				xs[i] = ReadEnumType();
        	}
			return xs;
		}

    }



    public partial class Item
    {

        public String Name;

        public Int32 Count;


		public override string ToString()
		{
			var br = new StringBuilder();
			br.Append("Item");

			br.Append(" Name(");

			if(Name != null)
			{
				br.Append(Name);
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" Count(");

			br.Append(Count);

			br.Append(")");

			return br.ToString();
		}
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

        public EnumType EnumValue;

        public Item Item;

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

        public EnumType[] EnumValueArray;

        public Item[] ItemArray;


		public override string ToString()
		{
			var br = new StringBuilder();
			br.Append("FullType");

			br.Append(" Boollean(");

			br.Append(Boollean);

			br.Append(")");

			br.Append(" Byte(");

			br.Append(Byte);

			br.Append(")");

			br.Append(" Int16(");

			br.Append(Int16);

			br.Append(")");

			br.Append(" Int32(");

			br.Append(Int32);

			br.Append(")");

			br.Append(" Int64(");

			br.Append(Int64);

			br.Append(")");

			br.Append(" UInt16(");

			br.Append(UInt16);

			br.Append(")");

			br.Append(" UInt32(");

			br.Append(UInt32);

			br.Append(")");

			br.Append(" UInt64(");

			br.Append(UInt64);

			br.Append(")");

			br.Append(" Single(");

			br.Append(Single);

			br.Append(")");

			br.Append(" Double(");

			br.Append(Double);

			br.Append(")");

			br.Append(" Stirng(");

			if(Stirng != null)
			{
				br.Append(Stirng);
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" EnumValue(");

			br.Append(EnumValue);

			br.Append(")");

			br.Append(" Item(");

			if(Item != null)
			{
				br.Append(Item);
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" BoolleanArray(");

			if(BoolleanArray != null)
			{
				foreach(var x in BoolleanArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" ByteArray(");

			if(ByteArray != null)
			{
				foreach(var x in ByteArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" Int16Array(");

			if(Int16Array != null)
			{
				foreach(var x in Int16Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" Int32Array(");

			if(Int32Array != null)
			{
				foreach(var x in Int32Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" Int64Array(");

			if(Int64Array != null)
			{
				foreach(var x in Int64Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" UInt16Array(");

			if(UInt16Array != null)
			{
				foreach(var x in UInt16Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" UInt32Array(");

			if(UInt32Array != null)
			{
				foreach(var x in UInt32Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" UInt64Array(");

			if(UInt64Array != null)
			{
				foreach(var x in UInt64Array)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" SingleArray(");

			if(SingleArray != null)
			{
				foreach(var x in SingleArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" DoubleArray(");

			if(DoubleArray != null)
			{
				foreach(var x in DoubleArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" StirngArray(");

			if(StirngArray != null)
			{
				foreach(var x in StirngArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" EnumValueArray(");

			if(EnumValueArray != null)
			{
				foreach(var x in EnumValueArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			br.Append(" ItemArray(");

			if(ItemArray != null)
			{
				foreach(var x in ItemArray)
				{
					br.Append(x);
					br.Append(", ");
				}
			}
			else
			{
				br.Append("null");
			}

			br.Append(")");

			return br.ToString();
		}
    }



	public enum EnumType
	{

		One = 1,

		Two = 2,

		Three = 3,

	}


}
}


























































