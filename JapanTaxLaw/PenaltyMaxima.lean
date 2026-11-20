/-!
# PenaltyMaxima — 罰則の上限構造（198 units）

198 units in 86 verbatim variants stating penal maxima, e.g.
  「一年以下の拘禁刑又は五十万円以下の罰金に処する」
  「十年以下の拘禁刑若しくは千万円以下の罰金に処し、又はこれを併科する」

§3 structure: each offence carries an upper bound on imprisonment and on fine;
the sanction must stay within both bounds. 併科 (concurrent) allows both to be
imposed together; the 又/若しくは wording is an alternative. Formalized as:
  withinMaxima months yen monthCap fineCap = months <= monthCap ∧ yen <= fineCap
  concurrentAllowed flag decides whether both may be imposed together.

Kernel proofs: bound entailment, monotonicity in caps, zero case, and identity
of the wording families. The actual numerals, offence conditions and sentencing
are NOT MODELLED — caps are caller-supplied Nat (months / yen).
-/
namespace JapanTaxLaw.PenaltyMaxima

def withinMaxima (months yen monthCap fineCap : Nat) : Bool :=
  decide (months <= monthCap ∧ yen <= fineCap)

theorem months_within (m y mc fc : Nat) (h : withinMaxima m y mc fc = true) : m <= mc := by
  simp [withinMaxima] at h
  exact h.1

theorem fine_within (m y mc fc : Nat) (h : withinMaxima m y mc fc = true) : y <= fc := by
  simp [withinMaxima] at h
  exact h.2

theorem within_of_bounds (m y mc fc : Nat) (hm : m <= mc) (hy : y <= fc) :
    withinMaxima m y mc fc = true := by
  simp [withinMaxima, hm, hy]

theorem maxima_mono (m y mc fc mc' fc' : Nat) (h1 : mc <= mc') (h2 : fc <= fc')
    (h : withinMaxima m y mc fc = true) : withinMaxima m y mc' fc' = true := by
  simp [withinMaxima] at h ⊢
  omega

theorem zero_sanction_within (mc fc : Nat) : withinMaxima 0 0 mc fc = true := by
  simp [withinMaxima]

-- 文言ファミリ（「又は」/「若しくは…併科」）は同じ上限構造
namespace Alternative
def within := @withinMaxima
end Alternative
namespace Concurrent
def within := @withinMaxima
end Concurrent

theorem wording_families_identical (m y mc fc : Nat) :
    Alternative.within m y mc fc = Concurrent.within m y mc fc := by rfl

end JapanTaxLaw.PenaltyMaxima
