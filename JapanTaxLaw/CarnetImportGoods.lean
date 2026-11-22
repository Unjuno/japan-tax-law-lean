import JapanTaxLaw.TaxFinance

/-!
# CarnetImportGoods — 通関手帳による輸入物品の指定（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 348CO0000000317
  Revision: 348CO0000000317_20010106_412CO0000000307
  Raw snapshot: data/raw/348CO0000000317_20010106_412CO0000000307.law.json
  Article Num 2, flat/normalized leaf text 110 chars, U+3000 count 0.

原文逐語:
  「関税定率法第十七条第一項各号の物品のうち政令で定める物品は、同項第一号及び
   第四号に掲げる物品以外の物品とする。」

Computation（原文逐語から導出、除外列挙のみ）:
  対象 = 各号物品のうち 第1号・第4号 を除くもの
  号を Nat 列挙: 第1号=1, 第2号=2, 第3号=3, 第4号=4
  isCarnetGood(no) = (no != 1 && no != 4)  -- 第2号・第3号が対象

Scope / NOT MODELLED:
  - 関税定率法17条1項各号の物品の具体内容は NOT MODELLED。
  - 通関手帳の種類・輸入手続は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CarnetImportGoods

open JapanTaxLaw.TaxFinance

/-- 第1号 = 1（除外）。 -/
def itemOne : Nat := 1
/-- 第2号 = 2。 -/
def itemTwo : Nat := 2
/-- 第3号 = 3。 -/
def itemThree : Nat := 3
/-- 第4号 = 4（除外）。 -/
def itemFour : Nat := 4

/-- 通関手帳輸入の対象物品（第1号・第4号以外）か。 -/
def isCarnetGood (itemNo : Nat) : Bool :=
  itemNo != itemOne && itemNo != itemFour

example : isCarnetGood itemOne = false := by decide
example : isCarnetGood itemTwo = true := by decide
example : isCarnetGood itemThree = true := by decide
example : isCarnetGood itemFour = false := by decide

end JapanTaxLaw.CarnetImportGoods
