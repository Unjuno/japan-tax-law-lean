/-\!
# TreatyJPUSInfoExchange — 日米租税条約 第二十六条（情報交換）

L3 条約層（別層）。第二十六条の情報交換・秘密保持構造をカーネル証明する：
- ２６１：権限当局は条約実施・租税法令運用に関連する情報を交換（第一条・第二条の
  制限を受けない）。要請があれば認証付き写しで提供。
- ２６２：受領情報は自国取得情報と同様に秘密として扱い、租税目的の者・当局にのみ開示。
- ２６３：自国法令・行政慣行に反する措置や入手不能情報の提供は義務付けられない。

具体的な情報内容・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSInfoExchange

-- ２６１：交換義務は第一条・第二条の制限を受けない
def exchangeUnbounded : Bool := true
theorem exchange_not_limited_by_scope : exchangeUnbounded = true := rfl

-- ２６２：秘密保持 — 目的適合者にのみ開示（purposeCompatible → mayDisclose）
def mayDisclose (purposeCompatible : Bool) : Bool := purposeCompatible
theorem tax_purpose_may_disclose : mayDisclose true = true := by decide
theorem unrelated_purpose_no_disclose : mayDisclose false = false := by decide

-- ２６３：入手不能情報は提供義務なし
def noDutyToProvide (obtainable : Bool) : Bool := !obtainable
theorem unobtainable_no_duty : noDutyToProvide false = true := by decide
theorem obtainable_has_duty : noDutyToProvide true = false := by decide

def infoExchangeDeclared : Bool := true
theorem info_exchange_is_declaration : infoExchangeDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSInfoExchange
