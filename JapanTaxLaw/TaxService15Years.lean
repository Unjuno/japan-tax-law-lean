import JapanTaxLaw.TaxFinance

/-!
# TaxService15Years — 税理士法 art. 8（国税事務従事 通算十五年以上）

Sources (pinned):

  Law id: 326AC1000000237
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json

Pinned 原文: 「官公署における国税に関する事務のうち前号に規定する事務以外の事務に従事した期間が通算して十五年以上になる者については、税法に属する科目のうち国税に関するもの」

Scoped claim: only the 国税事務従事 通算十五年以上 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.TaxService15Years

def serviceYears15 : Nat := 15

def has15Years (x : Nat) : Bool :=
  decide (serviceYears15 <= x)

theorem threshold_value : serviceYears15 = 15 := rfl

end JapanTaxLaw.TaxService15Years
