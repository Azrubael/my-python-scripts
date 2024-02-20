import unittest
from ip import checker, decimal_parser, bin2ip_converter


class MyTestCase(unittest.TestCase):

    def test_chkr1(self):
        res = checker('')
        self.assertEqual(res, False)
    
    def test_chkr2(self):
        res = checker('123.324.23.23')
        self.assertEqual(res, False)

    def test_chkr3(self):
        res = checker('1321.234.345.445/66')
        self.assertEqual(res, False)

    def test_chkr4(self):
        res = checker('123.324.23.23/166')
        self.assertEqual(res, False)

    def test_chkr5(self):
        res = checker('.234.234.234/234')
        self.assertEqual(res, False)

    def test_chkr6(self):
        res = checker('184.256.72.95/20')
        self.assertEqual(res, True)

    def test_chkr7(self):
        res = checker('184.35.72.95/ 33')
        self.assertEqual(res, True)

    def test_chkr8(self):
        res = checker('184.35.72.95\\20')
        self.assertEqual(res, False)

    def test_chkr9(self):
        res = checker('120.156.21.95/12')
        self.assertEqual(res, True)

    def test_dec_parser1(self):
        self.assertRaises(ValueError, decimal_parser, '120.156.21.95\\12')
        self.assertRaises(ValueError, decimal_parser, '120.256.21.95/12')
        self.assertRaises(ValueError, decimal_parser, '184.156.72.295/20')
        self.assertRaises(ValueError, decimal_parser, '120.156.21.95/33')

unittest.main()