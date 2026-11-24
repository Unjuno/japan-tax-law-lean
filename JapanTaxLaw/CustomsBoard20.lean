import JapanTaxLaw.TaxFinance

/-!
# CustomsBoard20 — 関税等不服審査会令 art. 1（関税等不服審査会 委員二十人以内）

Sources (pinned):

  Law id: 412CO0000000277
  Revision: 412CO0000000277_20160401_428CO0000000168
  Raw snapshot: data/raw/412CO0000000277_20160401_428CO0000000168.law.json

Pinned 原文: 「関税等不服審査会（以下「審査会」という。）は、委員二十人以内で組織する。」

Scoped claim: only the 関税等不服審査会 委員二十人以内 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.CustomsBoard20

def boardCap20 : Nat := 20

def withinBoard20 (x : Nat) : Bool :=
  decide (x <= boardCap20)

theorem threshold_value : boardCap20 = 20 := rfl

end JapanTaxLaw.CustomsBoard20
