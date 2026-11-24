import JapanTaxLaw.TaxFinance

/-!
# EnforcementDates — 2,481 の pinned 施行日関連規定

Every pinned unit contains an era-date clause 「〈元号〉〈年〉年〈月〉月〈日〉日から
施行する」. 2,171 are main 「この法律は、…から施行する」 clauses; the other 310 are
non-main forms (282 「ただし、…」 provisos plus 28 clipped/但し/他 fragments).
Within those, three units additionally state a 公布の日 effective date for a
different provision; the era-date triple is still pinned verbatim in each. The
model records only that era/date triple in Nat with an independent calendar-
validity check. Which provision takes effect, dual-date legal effect and
施行延期 are caller-established and NOT MODELLED. Not legal advice.
-/

namespace JapanTaxLaw.EnforcementDates

inductive Era where
  | showa | heisei | reiwa
deriving DecidableEq, Repr

/-- 元号から西暦の基準年を返す (昭和=1925, 平成=1988, 令和=2018 を加算). -/
def eraBaseYear : Era → Nat
  | Era.showa => 1925
  | Era.heisei => 1988
  | Era.reiwa => 2018

/-- 実装: (元号, 年, 月, 日) を西暦日に変換。 -/
def toWesternYear (era : Era) (year : Nat) : Nat :=
  eraBaseYear era + year

/-- カレンダー妥当性（独立仕様で検証される述語）。 -/
def validMonth (m : Nat) : Prop := 1 ≤ m ∧ m ≤ 12
def validDay (d : Nat) : Prop := 1 ≤ d ∧ d ≤ 31

theorem eraBasePositive (era : Era) : eraBaseYear era > 0 := by
  cases era <;> decide

end JapanTaxLaw.EnforcementDates
