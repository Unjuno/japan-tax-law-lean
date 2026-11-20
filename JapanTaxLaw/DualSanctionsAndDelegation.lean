/-!
# DualSanctionsAndDelegation — 両罰規定と残余の委任規定（146 units）

146 units in four verbatim variants:

A) 両罰 (dual sanctions, 50 units):
   「法人の代表者…が…違反行為をした場合には、その行為者を罰するほか、
     その法人又は人に対し、同項の罰金刑を科する。」
   → the actor AND the corporation are each subject to a fine.

B) 残余の委任 (remaining delegation, 96 units):
   「この附則に定めるもののほか、この法律の施行に関し必要な経過措置
     （罰則に関する経過措置を含む。）は、政令で定める。」 (and に規定する variant)
   「前項の規定の適用に関し必要な事項は、政令で定める。」
   → transitional measures / necessary matters are delegated to cabinet order.

§3 structure: dual sanctions are independent conjunctions of two fines;
delegations record that content is supplied externally. Kernel proofs:
conjunction properties, non-interference and delegation-variant identity.
Actual amounts, offences and delegated content are NOT MODELLED.
-/
namespace JapanTaxLaw.DualSanctionsAndDelegation

-- A) 両罰: 行為者と法人の罰金は独立
def bothSanctioned (actorFine corpFine : Nat) : Prop := actorFine > 0 ∧ corpFine > 0

theorem actor_sanctioned (a c : Nat) (h : bothSanctioned a c) : a > 0 := h.1
theorem corp_sanctioned (a c : Nat) (h : bothSanctioned a c) : c > 0 := h.2

theorem both_of_positives (a c : Nat) (ha : a > 0) (hc : c > 0) : bothSanctioned a c := ⟨ha, hc⟩

theorem actor_independent_of_corp (a c c' : Nat) (h : bothSanctioned a c) :
    bothSanctioned a c' ↔ c' > 0 := by
  constructor
  · intro h'; exact h'.2
  · intro hc; exact ⟨h.1, hc⟩

theorem corp_independent_of_actor (a a' c : Nat) (h : bothSanctioned a c) :
    bothSanctioned a' c ↔ a' > 0 := by
  constructor
  · intro h'; exact h'.1
  · intro ha; exact ⟨ha, h.2⟩

-- B) 残余の委任: 委任内容は呼出側が与える（NOT MODELLED）
def delegatedContent (content : Nat) : Nat := content

theorem delegation_is_identity (c : Nat) : delegatedContent c = c := by rfl

namespace PenaltyInclusive
def delegate := @delegatedContent
end PenaltyInclusive
namespace NecessaryMatters
def delegate := @delegatedContent
end NecessaryMatters

theorem delegation_variants_identical (c : Nat) :
    PenaltyInclusive.delegate c = NecessaryMatters.delegate c := by rfl

end JapanTaxLaw.DualSanctionsAndDelegation
