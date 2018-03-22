using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace sayandsee
{
    [TestClass]
    public class Program
    {
        static void Main(string[] args)
        {
            var c = "1";
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine(c);
                c = SayAndSee(c);
            }
        }

        static string SayAndSee(string val)
        {
            var groups = val
                .Aggregate(" ", (seed, next) => seed + (seed.Last() == next ? "" : " ") + next)
                .Trim()
                .Split(' ');
            return string.Join("", groups.Select(g => "" + g.Length + g[0]));
        }

        [TestMethod]
        public void SayAndSeeTest()
        {
            Assert.AreEqual("11", SayAndSee("1"));
            Assert.AreEqual("21", SayAndSee("11"));
            Assert.AreEqual("1211", SayAndSee("21"));
        }
    }
}
