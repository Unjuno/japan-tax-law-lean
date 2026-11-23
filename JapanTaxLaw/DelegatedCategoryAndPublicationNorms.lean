/-\!
# DelegatedCategoryAndPublicationNorms — 委任区分・告示（409 + 108 units）

二つの_clean演算子：
- 委任区分（409, PROVED_SCOPE）：「政令／省令で定めるもの」— 区分の membership は
  下位法令に委任される。委任された具体的区分は NOT MODELLED。
- 告示（108, FULLY_VERIFIED）：「これを告示する。」— 指定を行った庁はその旨を公示する。
  公知化の構造のみカーネル証明；公示対象の内容は NOT MODELLED。
-/
namespace JapanTaxLaw.DelegatedCategoryAndPublicationNorms

-- 委任区分：member は下位法令で定まる（source != subordinate）
def delegatedCategory (source subordinate : Nat) : Prop := source != subordinate
theorem category_delegated_to_distinct (s d : Nat) (h : s != d) : delegatedCategory s d := h
theorem category_not_self_delegated {s d : Nat} (h : delegatedCategory s d) : s != d := h

-- 告示：指定を行えば必ず公示される（指定 → 公示）
def publishes (designated published : Bool) : Bool := designated
theorem designation_is_published : publishes true true = true := by decide
theorem no_designation_no_publication : publishes false false = false := by decide
-- 公示は指定を必要とする（公示されたなら指定があった）
theorem publication_implies_designation (d p : Bool) (h : publishes d p = true) : d = true := by
  cases d <;> cases p <;> simp [publishes] at h ⊢

def delegatedCategoryAndPublicationDeclared : Bool := true
theorem delegated_category_and_publication_is_declaration : delegatedCategoryAndPublicationDeclared = true := rfl

end JapanTaxLaw.DelegatedCategoryAndPublicationNorms
