/-\!
# TreatyJPUSCollectionAssistance — 日米租税条約 第二十七条（徴収の援助）

L3 条約層（別層）。第二十七条の相互援助構造をカーネル証明する：
- ２７１：租税債権（税・利子・徴収費用・附加税・金銭罰）の徴収につき相互支援。
  第一条・第二条の制限を受けず、各締約国の法令で認められる範囲に限る。
- ２７２：支援は一定の租税債権（法人で MAP 係属/合意/手続終了、個人で被要請国
  国民でない等）に限る。

具体的な債権・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSCollectionAssistance

-- ２７１：法令で認められる範囲内でのみ支援（inLaw → mayAssist）
def mayAssist (permittedByLaw : Bool) : Bool := permittedByLaw
theorem law_permitted_assist : mayAssist true = true := by decide
theorem law_forbids_no_assist : mayAssist false = false := by decide

-- 支援は第一条・第二条の制限を受けない
def notLimitedByScope : Bool := true
theorem assistance_unbounded_by_scope : notLimitedByScope = true := rfl

-- ２７２：支援対象は eligible 且つ lawPermitted（両方必要）
def assistanceEligible (eligibleClaim permittedByLaw : Bool) : Bool :=
  eligibleClaim && permittedByLaw
theorem eligible_and_permitted : assistanceEligible true true = true := by decide
theorem ineligible_no_assist : assistanceEligible false true = false := by decide
theorem law_barred_no_assist : assistanceEligible true false = false := by decide

-- 支援が行われたなら対象適格かつ法適合
theorem assist_requires_both (e p : Bool) (h : assistanceEligible e p = true) : e = true ∧ p = true := by
  cases e <;> cases p <;> simp [assistanceEligible] at h ⊢

def collectionAssistanceDeclared : Bool := true
theorem collection_assistance_is_declaration : collectionAssistanceDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSCollectionAssistance
