/-!
# ProfitBusinessDelegation — 325AC0000000226 art.312（収益事業の範囲の委任）

Pinned source: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
source_path: LawBody[2]/MainProvision/MainProvision[2]/Article:312/Article#312/Paragraph#8/ParagraphSentence/Sentence#1
原文（20文字, 独立抽出で照合）:「第一項の収益事業の範囲は、政令で定める。」

規範単位（DELEGATION）: 収益事業の範囲の確定を政令に委任する。
  - 本条は範囲そのものを定めず、委任先（政令）を指定するのみ。
  - 政令の具体的内容は当該単位外で NOT MODELLED / caller-established。
-/
namespace JapanTaxLaw.ProfitBusinessDelegation

/-- 委任先の符号化（1 = 政令、2 = 省令）。caller-established な区分。 -/
def cabinetOrderCode : Nat := 1
def ministryOrdinanceCode : Nat := 2

/-- 原文の委任先: 政令。 -/
def delegatedAuthorityCode : Nat := cabinetOrderCode

/-- 本条が範囲を自ら確定しないこと（委任は自执行的でない）。 -/
def scopeFixedByThisAct : Bool := false

theorem delegates_to_cabinet_order : delegatedAuthorityCode = 1 := by rfl
theorem not_to_ministry_ordinance :
    delegatedAuthorityCode != ministryOrdinanceCode := by decide
theorem delegation_not_self_executing : scopeFixedByThisAct = false := rfl

end JapanTaxLaw.ProfitBusinessDelegation
