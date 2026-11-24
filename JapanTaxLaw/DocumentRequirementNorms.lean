/-\!
# DocumentRequirementNorms — 書類要件（する書類/した書類/書の提出）520 units, PROVED_SCOPE

520 clauses across tax laws ending with document-requirement suffixes:
  - 「…する書類」(352) — document that evidences/certifies a matter
  - 「…した書類」(102) — document in which a matter has been recorded
  - 「…書の提出」(66) — submission of a specified return/notice

Each is a documentary-requirement operator: a document with specified content
must exist / be submitted. Only the requirement structure is kernel-proven
(a document requirement is satisfied iff its document is present and its content
fields are complete; requirements compose under conjunction; absence of a required
document fails the requirement); the concrete documents, fields and filing
procedures are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DocumentRequirementNorms

-- 書類要件：書類が存在し記載が完全なら充足
def docRequirement (present : Bool) (complete : Bool) : Bool := present && complete
theorem requirement_satisfied : docRequirement true true = true := by decide
theorem requirement_fails_absent : docRequirement false true = false := by decide
theorem requirement_fails_incomplete : docRequirement true false = false := by decide
theorem requirement_needs_both (p c : Bool) :
    docRequirement p c = true -> p = true ∧ c = true := by
  cases p <;> cases c <;> simp [docRequirement]

-- 提出義務：提出済みなら充足
def submissionFulfilled (submitted : Bool) : Bool := submitted
theorem submission_done : submissionFulfilled true = true := by decide
theorem submission_pending : submissionFulfilled false = false := by decide

-- 複数要件の合成（すべての書類が必要）
def allRequirements (a b : Bool) : Bool := a && b
theorem all_both : allRequirements true true = true := by decide
theorem all_one_missing : allRequirements true false = false := by decide

-- 要件の含意：要件AがBを含む（Aが充足すればBも充足）
def requirementImplies (a b : Bool) : Bool := !a || b
theorem implies_carries (a b : Bool) (ha : a = true) (himp : requirementImplies a b = true) : b = true := by
  cases a <;> cases b <;> simp [requirementImplies] at ha himp ⊢

def documentRequirementDeclared : Bool := true
theorem document_requirement_is_declaration : documentRequirementDeclared = true := rfl

end JapanTaxLaw.DocumentRequirementNorms
