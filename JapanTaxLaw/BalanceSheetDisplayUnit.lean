import JapanTaxLaw.TaxFinance

/-!
# BalanceSheetDisplayUnit — 施行規則 art. 22の4(2) 表示単位

Pinned source: law 326M50000040055, revision
`326M50000040055_20260901_506M60000040025`, snapshot
`data/raw/326M50000040055_20260901_506M60000040025.law.json`.

Normative unit: `NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c`
Verbatim: 「貸借対照表に係る事項の金額は、一円単位、千円単位又は百万円単位を
もつて表示するものとする。」

Scope: the three permitted presentation units and their divisors (1 / 1000 /
1,000,000 yen). The statute names the units; which one a filer chooses is
caller-established. `scaledAmount` uses truncation as an explicitly documented
model choice — the statute's rounding rule is NOT asserted by this unit.
-/
namespace JapanTaxLaw.BalanceSheetDisplayUnit

/-- The three statutory presentation units. -/
inductive DisplayUnit where
  | oneYen | thousandYen | millionYen
  deriving DecidableEq, Repr

/-- Yen divisor per unit: 一円 / 千円 / 百万円. -/
def unitDivisor : DisplayUnit → Nat
  | DisplayUnit.oneYen => 1
  | DisplayUnit.thousandYen => 1_000
  | DisplayUnit.millionYen => 1_000_000

/-- Presentation amount in the chosen unit (truncation is a model choice). -/
def scaledAmount (u : DisplayUnit) (amountYen : Nat) : Nat :=
  amountYen / unitDivisor u

theorem divisor_one : unitDivisor DisplayUnit.oneYen = 1 := by rfl
theorem divisor_thousand : unitDivisor DisplayUnit.thousandYen = 1_000 := by rfl
theorem divisor_million : unitDivisor DisplayUnit.millionYen = 1_000_000 := by rfl

end JapanTaxLaw.BalanceSheetDisplayUnit
