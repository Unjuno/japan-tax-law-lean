/-\!
# TreatyJPUSTieBreaker — 日米租税条約 第四条３（双方居住者の地位決定）L3

Formalization of the Article 4(3) tie-breaker cascade (2003 Japan–US treaty,
pinned SHA-verified parsed MOF text): for an individual who is a resident of
both Contracting States, residence is determined by the first decisive criterion
in the ordered sequence:
  (a) permanent home; (b) centre of vital interests; (c) habitual abode;
  (d) nationality; (e) mutual agreement of the competent authorities.

L3_TREATY auxiliary layer — NOT merged into L0. Concrete facts caller-supplied
and NOT MODELLED. Human legal review pending.
-/
namespace JapanTaxLaw.TreatyJPUSTieBreaker

inductive State where | jp | us deriving DecidableEq

-- 最初に確定した基準が居住国を決定する（優先カスケード）
def resolve (home vital abode nation agreed : Option State) : Option State :=
  home <|> vital <|> abode <|> nation <|> agreed

theorem home_decides (s : State) (v a n g : Option State) :
    resolve (some s) v a n g = some s := by simp [resolve]

theorem vital_decides (s : State) (a n g : Option State) :
    resolve none (some s) a n g = some s := by simp [resolve]

theorem abode_decides (s : State) (n g : Option State) :
    resolve none none (some s) n g = some s := by simp [resolve]

theorem nation_decides (s : State) (g : Option State) :
    resolve none none none (some s) g = some s := by simp [resolve]

theorem agreement_decides (s : State) :
    resolve none none none none (some s) = some s := by simp [resolve]

theorem no_criterion : resolve none none none none none = none := rfl

-- 国内法上双方の居住者である場合にのみ適用（呼出側が与える）
def appliesToDualResident (residentJP residentUS : Bool) : Bool := residentJP && residentUS

theorem dual_both (r : Bool) : appliesToDualResident true true = true := by simp [appliesToDualResident]
theorem dual_single : appliesToDualResident true false = false := by simp [appliesToDualResident]

def tieBreakerDeclared : Bool := true
theorem tie_breaker_is_declaration : tieBreakerDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSTieBreaker
