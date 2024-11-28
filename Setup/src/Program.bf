using System;
using System.IO;

namespace Setup;

class Program
{
	public static void Main()
	{
		String staticLibPath, dynamicLibPath;
		findPaths: do
		{
#if BF_PLATFORM_WINDOWS
			Console.Write("Searching for clang binarys... ");
			if (Directory.Exists(@"C:\Program Files\LLVM")) do
			{
				staticLibPath = @"C:\Program Files\LLVM\lib\libclang.lib";
				dynamicLibPath = @"C:\Program Files\LLVM\bin\libclang.dll";
				if (!File.Exists(staticLibPath) || !File.Exists(dynamicLibPath)) break;
				Console.WriteLine("Done");
				break findPaths;
			}
			Console.WriteLine("Failed");
#endif			
			Console.Write("Please enter path to clang static library (should be in LLVM/lib/libclang.lib):");
			staticLibPath = Console.ReadLine(..scope .());
			Console.Write("Please enter path to clang dynamic library (should be in LLVM/bin/libclang.dll or .so):");
			dynamicLibPath = Console.ReadLine(..scope .());
		}
		if (!Directory.Exists("../deps"))
			Directory.CreateDirectory("../deps");
		Console.WriteLine("Copying from {}", staticLibPath);
		File.Copy(staticLibPath, "../deps/libclang.lib");
		Console.WriteLine("Copying from {}", dynamicLibPath);
		File.Copy(dynamicLibPath, "../deps/libclang.dll");
	}
}