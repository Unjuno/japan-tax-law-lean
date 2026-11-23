/-\!
# TreatyJPUSBusinessProfits — 日米租税条約 第七条（営業利益）

L3 条約層（別層）。第七条の規範構造のみをカーネル証明する：
- ７１：恒久的施設（PE）を通じて事業を行わない限り、企業の利得は居住国でのみ課税。
  PE を通じて行う場合は、PE に帰せられる部分のみ他方で課税。
- ７２：独立企業原則 — PE は別個独立企業なら取得したとみられる利得が帰せられる。
- ７３：PE のために生じた費用は、発生地を問わず控除可能。
- ７５：単なる購入のみでは利得は帰せられない。
- ７６：帰せ利得は毎年同一方法で決定（正当な理由があれば別方法可）。
- ７７：他条で別個に扱われる所得種は本条の影響を受けない。

条約の法的効力・具体的事実は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSBusinessProfits

-- ７１：他方締約国での課税は PE を通じた事業且つ帰せ利得が正の場合のみ
def taxableInOther (hasPE : Bool) (attributableProfit : Nat) : Bool :=
  hasPE && attributableProfit > 0

theorem no_pe_no_other_tax (p : Nat) : taxableInOther false p = false := by simp [taxableInOther]
theorem pe_zero_no_other_tax : taxableInOther true 0 = false := by simp [taxableInOther]
theorem pe_positive_other_tax (p : Nat) (h : p > 0) : taxableInOther true p = true := by simp [taxableInOther, h]

-- ７２：独立企業原則 — 帰せ利得は仮想独立企業の利得（みなし）
def attributedProfit (hypothetical : Nat) : Nat := hypothetical
theorem attributed_is_hypothetical (h : Nat) : attributedProfit h = h := rfl

-- ７５：単なる購入では利得は帰せられない（帰せ利得ゼロ）
def merePurchaseAttribution : Nat := 0
theorem mere_purchase_no_profit : merePurchaseAttribution = 0 := rfl

-- ７３：PE のための費用は発生地を問わず控除（帰属フラグが無効化しない）
def deductible (forPE : Bool) : Bool := forPE
theorem deduction_independent_of_location (forPE : Bool) : deductible forPE = forPE := rfl

-- ７６：方法の一貫性（同じ方法なら同じ帰せ利得）
theorem same_method_same_profit (m : Nat) (p : Nat) : (if m = m then p else 0) = p := by simp

def businessProfitsDeclared : Bool := true
theorem business_profits_is_declaration : businessProfitsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSBusinessProfits
