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
            var groups = SplitIntoGroups(val);
            return string.Join("", groups.Select(g => "" + g.Item1 + g.Item2));
        }

        static IEnumerable<Tuple<int, char>> SplitIntoGroups(string val)
        {
            int count = 1;
            for (int i = 1; i < val.Length; i++)
            {
                if (i == 0 || val[i] == val[i - 1])
                {
                    count++;
                }
                else 
                {
                    yield return Tuple.Create(count, val[i - 1]);
                    count = 1;
                }
            }
            yield return Tuple.Create(count, val.Last());
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
