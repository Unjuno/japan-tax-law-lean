/-!
# DeemedTaxedAmount — 332AC0000000026 art.66_9_4（課税済金額とみなす）

Pinned source: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
source_path: LawBody[3]/MainProvision/MainProvision[2]/Article:66_9_4/Article#66_9_4/Paragraph#5/TableStruct/Table/TableRow/TableColumn/Sentence#1
原文（9文字, 独立抽出で照合）:「課税済金額とみなす」

規範単位（DEEMING）: 当該金額に「課税済」の法的状態を与える（擬制）。
  - valueYen: 金額（円、Nat、caller-established）
  - taxableFlag: 課税済かどうかの法的状態（caller-established な入力）
擬制は金額の数値を変えず、状態を「課税済」に設定する。算定基数・税率・
他のみなし規定は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.DeemedTaxedAmount

/-- 金額とその課税状態。 -/
structure AmountState where
  valueYen : Nat
  taxableFlag : Bool
  deriving DecidableEq

/-- 原文「課税済金額とみなす」: 数値は保ち、状態だけを課税済にする。 -/
def deemTaxed (a : AmountState) : AmountState :=
  { a with taxableFlag := true }

/-- 擬制は金額を変えない。 -/
theorem value_preserved (a : AmountState) : (deemTaxed a).valueYen = a.valueYen := rfl

/-- 擬制後は必ず課税済状態になる。 -/
theorem flag_set (a : AmountState) : (deemTaxed a).taxableFlag = true := rfl

/-- 擬制は冪等（二度適用しても同じ）。 -/
theorem idempotent (a : AmountState) : deemTaxed (deemTaxed a) = deemTaxed a := by
  cases a
  rfl

end JapanTaxLaw.DeemedTaxedAmount
