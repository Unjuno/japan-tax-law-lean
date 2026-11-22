import JapanTaxLaw.TaxFinance

/-
# TobaccoRatePerThousand — たばこ税法 第十一条（税率千本につき六千八百二円）

Pinned source:
  Law id: 359AC0000000072
  Revision: 359AC0000000072_20260525_506AC0000000052
  Raw snapshot: data/raw/359AC0000000072_20260525_506AC0000000052.law.json
  sha256: 6079422da9d83bb97d68e5fd824b92563d7a0e183cabdf88fc0d9e0cd241e2cd
  Statutory article: 第十一条 (raw JSON Article attr.Num = "11")

原文逐語（pinned, 一字一句改変なし）:
  「たばこ税の税率は、千本につき六千八百二円とする。」

Variable contract:
  cigarettes : Nat = たばこの本数 (単位 本).
  ratePerThousand = 六千八百二 = 6802 円 / 1000 本.
  unitCount = 千 = 1000 本.
  result : Nat = たばこ税額 (単位 円, whole yen), Nat floor division.

Computation (原文の明示的な率のみを厳密表現):
  taxFor cigarettes = cigarettes * 6802 / 1000   (Nat の切り捨て除算)

Scope / BY-DESIGN:
  - 本スライスは第一項の明示的な率「千本につき六千八百二円」のみを扱う。
  - 本数が 1000 で割り切れる場合（例: 0, 1000, 2000 本）に限り、商は厳密な
    円額となる。割り切れない本数では Nat の除算は切捨て（floor division）を
    与えるが、原文は金額（円）を返すため切捨てをそのまま採用する —
    BY-DESIGN / CONFIRMED。
  - 第二項の特定販売業者以外の引取りに係る税率（千本につき一万四千四百二十四円）、
    課税標準、製造・販売の認定、附則・経過措置は NOT MODELLED。
  - 本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TobaccoRatePerThousand

/-- 六千八百二 — the statutory rate per 1000 cigarettes = 6802 円. -/
def ratePerThousand : Nat := 6802

/-- 千 — the statutory unit count = 1000 本. -/
def unitCount : Nat := 1000

/-- たばこ税額 = たばこの本数 * 6802 / 1000 (Nat floor division). -/
def taxFor (cigarettes : Nat) : Nat :=
  cigarettes * ratePerThousand / unitCount

/-- 0 本 → 0 円. -/
example : taxFor 0 = 0 := by decide

/-- 1000 本（千本）→ 6802 円 (exact). -/
example : taxFor 1000 = 6802 := by decide

/-- 2000 本（二千本）→ 13604 円 (exact). -/
example : taxFor 2000 = 13604 := by decide

/-- 定数値. -/
example : ratePerThousand = 6802 := by rfl
example : unitCount = 1000 := by rfl

end JapanTaxLaw.TobaccoRatePerThousand
