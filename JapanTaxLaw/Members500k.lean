import JapanTaxLaw.TaxFinance

/-!
# Members500k — 租税特別措置法 art. 68（組合員その他の構成員の数 五十万人以上）

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json

Pinned 原文: 「当該事業年度終了の時における組合員その他の構成員の数が五十万人以上であること。」

Scoped claim: only the 組合員その他の構成員の数 五十万人以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.Members500k

def memberFloor500k : Nat := 500000

def hasMembers500k (x : Nat) : Bool :=
  decide (memberFloor500k <= x)

theorem threshold_value : memberFloor500k = 500000 := rfl

end JapanTaxLaw.Members500k
