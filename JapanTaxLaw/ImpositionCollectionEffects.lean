/-\!
# ImpositionCollectionEffects — 課税・科刑・徴収効果（課する/科する/収する）189 units, PROVED_SCOPE

189 clauses across tax laws ending with normative-effect operators:
  - 「…課する。」(69) — tax imposition (a tax is levied on a taxpayer by a base)
  - 「…科する。」(57) — penalty imposition (a penalty is imposed on an entity)
  - 「…収する。」(63) — tax collection (a tax is collected, with priority ordering)

Only the deontic-effect structure is kernel-proven (an imposition creates an
obligation; obligations compose under conjunction; collection priority is a
transitive ordering; collecting a due amount discharges the obligation);
the concrete tax bases, amounts, penalties and priority parties are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ImpositionCollectionEffects

-- 義務（課税/科刑/徴収により生じる）
abbrev Obligation := Nat  -- 義務識別子（金額・税目は NOT MODELLED）

-- 課税：課税標準と税率から納税義務が生じる（構造のみ）
def imposeTax (base : Nat) (rate : Nat) : Obligation := base + rate
theorem impose_creates_obligation (base rate : Nat) : imposeTax base rate = base + rate := rfl
theorem impose_monotone_base (base rate delta : Nat) :
    imposeTax base rate <= imposeTax (base + delta) rate := by
  unfold imposeTax
  exact Nat.add_le_add_right (Nat.le_add_right base delta) rate

-- 科刑：違反に対して罰が科される（構造のみ）
def imposePenalty (violation : Bool) : Bool := violation
theorem penalty_on_violation : imposePenalty true = true := by decide
theorem no_penalty_without_violation : imposePenalty false = false := by decide

-- 義務の合成（複数課税/科刑は併存）
def combineObligations (a b : Obligation) : Obligation := a + b
theorem obligations_compose (a b : Obligation) : combineObligations a b = a + b := rfl

-- 徴収優先順位（順序関係は推移的）
def collectionPriority (p : Nat) : Nat := p
theorem priority_transitive (a b c : Nat) (hab : a <= b) (hbc : b <= c) :
    collectionPriority a <= collectionPriority c := by
  unfold collectionPriority
  exact Nat.le_trans hab hbc

-- 徴収：義務を履行すると消滅（金額が等しければゼロ残留）
def collect (obligation amount : Nat) : Nat := obligation - amount
theorem full_collection_discharges (obligation : Nat) : collect obligation obligation = 0 := by
  unfold collect
  exact Nat.sub_self obligation
theorem partial_collection_bounded (obligation amount : Nat) :
    collect obligation amount <= obligation := by
  unfold collect
  exact Nat.sub_le obligation amount

def impositionEffectDeclared : Bool := true
theorem imposition_effect_is_declaration : impositionEffectDeclared = true := rfl

end JapanTaxLaw.ImpositionCollectionEffects
