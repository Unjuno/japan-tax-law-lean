import JapanTaxLaw.TaxFinance

/-!
# GroupRevenue100B — 租税特別措置法 art. 66_4_4（多国籍企業グループ総収入金額 千億円以上）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「多国籍企業グループのうち、直前の最終親会計年度における多国籍企業グループの総収入金額として財務省令で定める金額が千億円以上であるものをいう。」

Scoped claim: only the 多国籍企業グループ総収入金額 千億円以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.GroupRevenue100B

def revenueFloor100B : Nat := 100000000000

def hasRevenue100B (x : Nat) : Bool :=
  decide (revenueFloor100B <= x)

theorem threshold_value : revenueFloor100B = 100000000000 := rfl

end JapanTaxLaw.GroupRevenue100B
