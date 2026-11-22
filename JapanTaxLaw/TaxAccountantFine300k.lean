import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantFine300k — 税理士法 art. 65（過料 三十万円以下）

Sources (pinned):

  Law id: 326AC1000000237
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json

Pinned 原文: 「次の各号のいずれかに該当する場合には、税理士法人の社員若しくは清算人又は税理士会若しくは日本税理士会連合会の役員は、三十万円以下の過料に処する。」

Scoped claim: only the 過料 三十万円以下 threshold; other conditions are caller-established.
-/

namespace JapanTaxLaw.TaxAccountantFine300k

def fineCap300k : Nat := 300000

def withinFine300k (x : Nat) : Bool :=
  decide (x <= fineCap300k)

theorem threshold_value : fineCap300k = 300000 := rfl

end JapanTaxLaw.TaxAccountantFine300k
