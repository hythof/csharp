これは何？
=========
- C#のみで高速にシリアライズ/デシリアライズでき、型安全

- await/asyncには対応しないのでバッファを満たしてからnew MemoryStream(bytes)等としてから使う
  これはC# 5.0未満の環境への配慮

- 数値は可変長数値表現を採用して圧縮する
  https://en.wikipedia.org/wiki/Variable-length_quantity

- 配列の上限は 2 ** 32


コード例
========
Stream stream;

// 読み込み
var r = new BinaryPackerReader(stream);
byte a = r.ReadByte();
int[] b = r.ReadInt32Array();

// 書き込み
var w = new BinaryPackerWriter(stream); // デフォルトバッファサイズを指定
w.Write((byte)1);
w.WriteArray(new int[]{ 1, 2, 3 });
