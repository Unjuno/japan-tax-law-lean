/-!
# DeemedFilingDatesSpec — 独立形式仕様

pinned 原文（325AC0000000073 art.39/42 の記載日擬制六条）から独立に読み取った
仕様。実装を import しない。

「記載されていないときは〜とみなす」は、記載日が無い場合に呼出側が与える
擬制日を採用する規則。暦計算は原文片にないため NOT MODELLED。
-/
namespace JapanTaxLaw.DeemedFilingDatesSpec

/-- 記載日がある場合はその日、無い場合は擬制日。 -/
def effectiveSpec (written : Option Nat) (deemed : Nat) : Nat :=
  match written with
  | some d => d
  | none => deemed

/-- 分岐条件（原文の「記載されていないとき」）。 -/
def absentSpec (written : Option Nat) : Prop := written = none

end JapanTaxLaw.DeemedFilingDatesSpec
