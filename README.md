# NSPreciate 数组筛选
## 优点：避免使用多个for循环，节省大量代码.

## 注意点：
```
1.For strings, you can use any of the following filters: (NOTE: must be all caps)

BEGINSWITH
ENDSWITH
LIKE
MATCHES
CONTAINS

2.For numbers, you can use:

!=
>
>=
<
<=
==

3.OR 、AND 等关键字不区分大小写，但非关键字区分大小写

4.%@ is a var arg substitution for an object value—often a string, number, or date.
%K is a var arg substitution for a key path.

5.为了减少匹配规则名称，可以在这些运算符后面添加修饰符：[c]表示不区分大小写，[d]表示不区分发音符号 ,[cd]表示两者都不区分。
```
## 具体使用，见dmeon内部

## 参考博客
1.https://www.infragistics.com/community/blogs/stevez/archive/2013/10/21/ios-objective-c-filtering-a-nsarray-using-nspredicate.aspx

2.https://stackoverflow.com/questions/18822777/nspredicate-on-an-nsarray-to-search-for-any-object

3.http://nshipster.com/nspredicate/（swift）
