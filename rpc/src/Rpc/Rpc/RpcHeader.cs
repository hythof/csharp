using System;

namespace Rpc
{
    // TODO サイズ縮小
    public class RpcHeader
    {
        public const uint HeaderLength = 8;
        public readonly bool IsRequest;
        public readonly uint MethodId;
        public readonly uint PacketId;
        public readonly uint Length;
        public readonly ulong Request;

        public RpcHeader(ulong binary)
        {
            uint head = (uint)(binary >> 32);
            Length = (uint)(binary & 0x00000000ffffffff);
            Request = binary & 0x7fffffffffffffff;
            IsRequest = (head & 0x80000000) == 0;
            MethodId = (head & 0x7fffffff) >> 16;
            PacketId = head & 0x0000ffff;
        }

        // TODO 分かりやすくする
        public RpcHeader(uint methodId, uint packetId, uint length)
            : this(
                ((ulong)(((methodId << 16) + (packetId <= UInt16.MaxValue ? packetId : packetId >> 16)) & 0x7fffffff) << 32) +
                (ulong)length
            )
        {
        }

        public ulong Response(uint length)
        {
            return ((Request | 0x8000000000000000) & 0xffffffff00000000) + (ulong)length;
        }
    }
}