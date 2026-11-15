import JapanTaxLaw.CorpActor

/-!
# CorpActor tests — 法人税法 actor classification (Act art. 2 items 3,4)

Decidable smoke checks for the corporation actor model. Scoped to the
classification question only; scope beyond Art. 2 is not claimed.
-/

namespace JapanTaxLaw

-- Verified domestic head office
example : (⟨.yes, .unknown⟩ : CorpActorFacts) |> isDomesticCorpVerdict |> (· = Verdict.yes) := by
  decide

-- Verified domestic main office
example : (⟨.unknown, .yes⟩ : CorpActorFacts) |> isDomesticCorpVerdict |> (· = Verdict.yes) := by
  decide

-- Neither verified domestic ⇒ determinable non-affirmative
example : (⟨.no, .no⟩ : CorpActorFacts) |> isDomesticCorpVerdict |> (· = Verdict.no) := by
  decide

-- Foreign case holds deterministically
example : (⟨.no, .no⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .foreign) := by
  decide

-- Resident via head office
example : (⟨.yes, .no⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .resident) := by
  decide

-- Resident via main office
example : (⟨.no, .yes⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .resident) := by
  decide

-- Both unknown ⇒ indeterminate, not foreign
example : (⟨.unknown, .unknown⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .indeterminate) := by
  decide
example : ¬ ((⟨.unknown, .unknown⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .foreign)) := by
  decide

-- Conflict on one input, no valid basis otherwise ⇒ inconsistent
example : (⟨.conflict, .no⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .inconsistent) := by
  decide

-- Conflict on other input: yes dominates conflict in this model
example : (⟨.yes, .conflict⟩ : CorpActorFacts) |> classifyCorpActor |> (· = .resident) := by
  decide

end JapanTaxLaw
