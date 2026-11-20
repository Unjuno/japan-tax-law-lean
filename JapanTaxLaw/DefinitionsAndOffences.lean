/-\!
# DefinitionsAndOffences — 定義・省令事項・犯罪・罰金上限（506 units）

506 dependency-ready units in nine repeated §3 families. All definitions,
amounts, ages and offender identities are caller-supplied; only structure is
kernel-proven.

1. 定義規定 (88): 次の各号に掲げる用語の意義は当該各号に定めるところによる.
2. 省令事項 (230): …その他財務省令で定める事項（外部が与える）.
3. 年齢・人口閾値 (35): 六十五歳以上人口 etc.
4. 質問不答・虚偽答弁 (20): 徴税吏員の質問への不答/虚偽答弁.
5. 納税管理人虚偽申告 (15): 虚偽申告＋三十万円以下の罰金.
6. 両罰変形 (67): 行為者＋法人の罰金刑.
7. 罰金上限 (22): 三十万/五十万/一百万円以下の罰金に処する.
8. 貸付け区分 (15): 次のいずれかに該当する金銭の貸付け.
9. 土地買取 (14): 買取りをする者が地方公共団体である場合.
-/
namespace JapanTaxLaw.DefinitionsAndOffences

-- 1) 定義ルックアップ
def lookupDefinition : List (Nat × Nat) -> Nat -> Option Nat
  | [], _ => none
  | (k, v) :: rest, q => if q == k then some v else lookupDefinition rest q

theorem definition_hit (k v : Nat) (r : List (Nat × Nat)) : lookupDefinition ((k, v) :: r) k = some v := by
  simp [lookupDefinition]

theorem definition_miss (q : Nat) : lookupDefinition [] q = none := by rfl

-- 2) 省令事項（外部が与える）
def ministryMatter (content : Nat) : Nat := content

theorem ministry_identity (c : Nat) : ministryMatter c = c := by rfl

-- 3) 年齢・人口閾値
def atLeastSixtyFive (age : Nat) : Bool := decide (65 <= age)

theorem sixtyfive_at_boundary : atLeastSixtyFive 65 = true := by decide
theorem sixtyfive_below : atLeastSixtyFive 64 = false := by decide
theorem sixtyfive_above (a : Nat) (h : 65 <= a) : atLeastSixtyFive a = true := by simp [atLeastSixtyFive, h]

def ratioOver95 (percent : Nat) : Bool := decide (95 < percent)

theorem ratio_at_95 : ratioOver95 95 = false := by decide
theorem ratio_over_95 : ratioOver95 96 = true := by decide
theorem ratio_over (p : Nat) (h : 95 < p) : ratioOver95 p = true := by simp [ratioOver95, h]

-- 4) 質問不答・虚偽答弁
inductive TaxQuestionOffence where | noAnswer | falseAnswer deriving DecidableEq

def isQuestionOffence (o : TaxQuestionOffence) : Prop :=
  match o with | .noAnswer => True | .falseAnswer => True

theorem no_answer_is_offence : isQuestionOffence .noAnswer := trivial
theorem false_answer_is_offence : isQuestionOffence .falseAnswer := trivial

-- 5) 納税管理人虚偽申告
def falseTaxManagerReturn (falseReturn : Bool) (unjustMeans : Bool) : Bool := falseReturn || unjustMeans

theorem false_return_offence : falseTaxManagerReturn true false = true := by decide
theorem unjust_means_offence : falseTaxManagerReturn false true = true := by decide

-- 6) 両罰変形
def bothPunishedFine (actorFine corpFine : Nat) : Prop := actorFine > 0 ∧ corpFine > 0

theorem actor_fine (a c : Nat) (h : bothPunishedFine a c) : a > 0 := h.1
theorem corp_fine (a c : Nat) (h : bothPunishedFine a c) : c > 0 := h.2

-- 7) 罰金上限
def penaltyCap300k : Nat := 300000
def penaltyCap500k : Nat := 500000
def penaltyCap1m : Nat := 1000000

def withinCap (amount cap : Nat) : Bool := decide (amount <= cap)

theorem within_300k_boundary : withinCap penaltyCap300k penaltyCap300k = true := by decide
theorem over_300k : withinCap 300001 penaltyCap300k = false := by decide
theorem cap_monotone (a : Nat) (h : a <= penaltyCap300k) : withinCap a penaltyCap1m = true := by
  unfold withinCap penaltyCap1m
  have h300 : a <= 300000 := by simpa [penaltyCap300k] using h
  have ha : a <= 1000000 := by omega
  simp [ha]

-- 8) 貸付け区分
inductive LoanCategory where | specified | other deriving DecidableEq

def isSpecifiedLoan (c : LoanCategory) : Prop := match c with | .specified => True | .other => False

theorem specified_is_loan : isSpecifiedLoan .specified := trivial
theorem other_is_not_specified : ¬ isSpecifiedLoan .other := by simp [isSpecifiedLoan]

-- 9) 土地買取
def localGovernmentAcquirer (isLocalGov : Bool) : Bool := isLocalGov

theorem local_gov_acquirer : localGovernmentAcquirer true = true := by decide
theorem non_local_acquirer : localGovernmentAcquirer false = false := by decide

end JapanTaxLaw.DefinitionsAndOffences
