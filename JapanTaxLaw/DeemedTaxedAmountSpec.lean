/-!
# DeemedTaxedAmountSpec — 独立形式仕様

pinned 原文「課税済金額とみなす」から独立に読み取った仕様。
実装を import しない。
-/
namespace JapanTaxLaw.DeemedTaxedAmountSpec

/-- 仕様側の金額状態（実装の構造体とは別定義）。 -/
structure SpecAmount where
  yen : Nat
  alreadyTaxed : Bool

/-- 原文の擬制: 額はそのまま、課税済状態に設定する。 -/
def specDeem (a : SpecAmount) : SpecAmount :=
  { a with alreadyTaxed := true }

end JapanTaxLaw.DeemedTaxedAmountSpec
