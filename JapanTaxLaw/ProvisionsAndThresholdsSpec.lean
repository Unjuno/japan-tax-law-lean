/-\!
# ProvisionsAndThresholdsSpec — 独立形式仕様

pinned 原文（読替・施行参照・割合・重量閾値 1421条片）から独立に読み取った仕様。
実装を import しない。

読替・準用は外部が与える字句の置換。割合は閾値との比較、重量は 500kg を境とする
二分。施行参照は trigger <= date。接続詞・委任・区域外執行は構造記録。
具体的な字句・日付・割合・重量は NOT MODELLED。
-/
namespace JapanTaxLaw.ProvisionsAndThresholdsSpec

def substituteSpec (old new x : Nat) : Nat := if x == old then new else x
def atLeastSpec (p t : Nat) : Prop := t <= p
def belowSpec (p t : Nat) : Prop := p < t
def effectiveSpec (d t : Nat) : Prop := t <= d
def halfTonSpec : Nat := 500
def underSpec (w : Nat) : Bool := decide (w <= 500)
def overSpec (w : Nat) : Bool := decide (500 < w)
def delegatedSpec (c : Nat) : Nat := c

end JapanTaxLaw.ProvisionsAndThresholdsSpec
