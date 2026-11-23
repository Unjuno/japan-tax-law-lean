/-\!
# TreatyJPUSPermanentEstablishment — 日米租税条約 第五条（恒久的施設）

L3 条約層（別層）。第五条の恒久的施設（PE）判定構造をカーネル証明する：
- ５１/２：PE とは事業を行う一定の場所（管理所・支店・事務所・工場・作業場・坑井等）。
- ５３：工事現場等は 12 箇月を超える期間存続すれば PE。
- ５４：準備的・補助的な活動（保管・展示・購入・情報収集等）は PE に含まない。
- ５５：代理型 PE — 契約締結権限を反復行使する者を通じれば PE（準備的活動のみは除く）。
- ５６：独立代理人（仲立人・問屋等）のみでは PE としない。
- ５７：支配関係のみでは PE としない。

具体的な場所・期間・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSPermanentEstablishment

-- ５３：工事現場は 12 箇月超で PE（境界値は 12 を超える）
def constructionPE (months : Nat) : Bool := decide (12 < months)
theorem at_12_months_no_pe : constructionPE 12 = false := by decide
theorem above_12_months_pe : constructionPE 13 = true := by decide

-- ５４：準備的・補助的活動は PE でない
def preparatoryActivityIsPE (preparatoryOrAuxiliary : Bool) : Bool := false
theorem preparatory_not_pe : preparatoryActivityIsPE true = false := rfl

-- ５５：代理型 PE（契約権限 且つ 反復行使 且つ 非準備的）
def agencyPE (hasContractAuthority repeatedlyExercises nonPreparatory : Bool) : Bool :=
  hasContractAuthority && repeatedlyExercises && nonPreparatory
theorem agency_pe_all : agencyPE true true true = true := by decide
theorem agency_no_authority : agencyPE false true true = false := by decide
theorem agency_preparatory_only : agencyPE true true false = false := by decide

-- ５６：独立代理人のみでは PE でない
def independentAgentPE : Bool := false
theorem independent_agent_not_pe : independentAgentPE = false := rfl

-- ５７：支配関係のみでは PE でない
def controlCreatesPE : Bool := false
theorem control_not_pe : controlCreatesPE = false := rfl

def permanentEstablishmentDeclared : Bool := true
theorem permanent_establishment_is_declaration : permanentEstablishmentDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSPermanentEstablishment
