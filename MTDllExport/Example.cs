using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;
using System.Windows.Forms;

namespace MTDllExportExample
{
    public class Example
    {
		[DllExport]
		public static void MsgBox([MarshalAs(UnmanagedType.LPWStr)] string msg)
		{
			MessageBox.Show(msg);
		}


		private static List<MqlTick> list;

		[DllExport]
		public static int Add(int left, int right)
		{
			return left + right;
		}

		[DllExport]
		public static int Sub(int left, int right)
		{
			return left - right;
		}

		[DllExport]
		public static double AddDouble(double left, double right)
		{
			return left + right;
		}

		[DllExport]
		public static float AddFloat(float left, float right)
		{
			return left + right;
		}

		[DllExport]
		public static int Get1DInt([MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] int[] tab, int i, int idx)
		{
			return tab[idx];
		}

		[DllExport]
		public static float Get1DFloat([MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] float[] tab, int i, int idx)
		{
			return tab[idx];
		}

		[DllExport]
		public static double Get1DDouble([MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] double[] tab, int i, int idx)
		{
			return tab[idx];
		}

		[DllExport]
		public static int SetFiboArray([MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] int[] tab, int len, [In, Out, MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] int[] res)
		{
			res[0] = 0;
			res[1] = 1;

			if (len < 3) return -1;
			for (int i = 2; i < len; i++)
				res[i] = res[i - 1] + res[i - 2];
			return 0;
		}

		public static int idx(int a, int b) { int cols = 2; return a * cols + b; }

		[DllExport]
		public static int Set2DArray([In, Out, MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 1)] int[] tab, int len)
		{
			tab[idx(0, 0)] = 0;
			tab[idx(0, 1)] = 1;
			tab[idx(1, 0)] = 2;
			tab[idx(1, 1)] = 3;
			tab[idx(2, 0)] = 4;
			tab[idx(2, 1)] = 5;

			return 0;
		}

		[DllExport]
		public static int ReplaceString([In, Out, MarshalAs(UnmanagedType.LPWStr)] StringBuilder str, [MarshalAs(UnmanagedType.LPWStr)] string a, [MarshalAs(UnmanagedType.LPWStr)] string b)
		{
			str.Replace(a, b);

			if (str.ToString().Contains(a)) return 1;
			else return 0;
		}

		[ComVisible(true)]
		[StructLayout(LayoutKind.Sequential, Pack = 1)]
		public struct MqlTick
		{
			public Int64 Time;
			public Double Bid;
			public Double Ask;
			public Double Last;
			public UInt64 Volume;
		}

		[DllExport]
		public static int AddTick(ref MqlTick tick, ref double bidsum)
		{
			bidsum = 0.0;

			if (list == null) list = new List<MqlTick>();

			tick.Volume = 666;
			list.Add(tick);

			foreach (MqlTick t in list) bidsum += t.Ask;

			return list.Count;
		}
	}
}
