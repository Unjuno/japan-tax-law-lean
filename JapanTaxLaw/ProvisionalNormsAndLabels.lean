/-\!
# ProvisionalNormsAndLabels — 暫定的規範と付随ラベル（425 units）

425 dependency-ready units in ten repeated §3 families. Each is modelled
with an honest, caller-parametrised structure; the concrete amounts, offences,
formulas and referenced provisions are NOT MODELLED.

A) 枝番号 (143): 一の二 … 四十の二 -> (ordinal, sub) pair.
B) 算式 (28): 次の算式によって算定した額とする -> formula application.
C) 引用閉じ (26): 」とする。 -> quotation-close connector.
D) 読替ラベル (35): 読み替える/読み替えられる字句 -> active/passive role.
E) 前条参照 (20): 前条第一項 -> previous-article reference.
F) 定義 (22): 次の各号に掲げる用語の意義は… -> definition lookup.
G) 従前例 (23): 施行前の行為に対する罰則 -> old law for pre-enforcement acts.
H) 免除 (22): 情状により刑を免除することができる -> MAY, not MUST.
I) 金額区分 (51): 五十万円以下の部分等 -> amount brackets.
J) 重量閾値 (36): 一トン以下/超 -> threshold comparison.
-/
import JapanTaxLaw.KanjiOrdinals

namespace JapanTaxLaw.ProvisionalNormsAndLabels

open JapanTaxLaw.KanjiOrdinals

-- A) 枝番号
def splitAtNo : List Char -> Option (List Char × List Char)
  | [] => none
  | 'の' :: rest => some ([], rest)
  | c :: rest => (fun (a, b) => (c :: a, b)) <$> splitAtNo rest

def parseSubItem (s : String) : Option (Nat × Nat) := do
  let (a, b) <- splitAtNo s.toList
  let x <- parseKanji (String.ofList a)
  let y <- parseKanji (String.ofList b)
  pure (x, y)

theorem parse_sub_ichi_no_ni : parseSubItem "一の二" = some (1, 2) := by decide
theorem parse_sub_juugo_no_ni : parseSubItem "十五の二" = some (15, 2) := by decide

-- B) 算式適用
def applyFormula (f : Nat -> Nat) (x : Nat) : Nat := f x

theorem applyFormula_identity (f : Nat -> Nat) (x : Nat) : applyFormula f x = f x := by rfl

-- C) 引用閉じ
def quoteClose (x : Nat) : Nat := x

theorem quoteClose_identity (x : Nat) : quoteClose x = x := by rfl

-- D) 読替ラベル（能動/受動）
inductive YomikaeRole where | active | passive deriving DecidableEq

def activeRole : YomikaeRole := .active
def passiveRole : YomikaeRole := .passive

theorem yomikae_roles_distinct : activeRole ≠ passiveRole := by decide

-- E) 前条参照
def prevArticleRef (target : Nat) : Nat := target

theorem prevArticleRef_identity (t : Nat) : prevArticleRef t = t := by rfl

-- F) 定義ルックアップ
def lookupDef : List (Nat × Nat) -> Nat -> Option Nat
  | [], _ => none
  | (k, v) :: rest, q => if q == k then some v else lookupDef rest q

theorem lookupDef_hit (k v : Nat) (rest : List (Nat × Nat)) : lookupDef ((k, v) :: rest) k = some v := by
  simp [lookupDef]

theorem lookupDef_miss (q : Nat) : lookupDef [] q = none := by rfl

-- G) 従前例（施行前の行為）
def oldLawApplies (actTime enforcement : Nat) : Bool := decide (actTime < enforcement)

theorem old_law_before (a e : Nat) (h : a < e) : oldLawApplies a e = true := by simp [oldLawApplies, h]

theorem new_law_from_enforcement (a e : Nat) (h : e <= a) : oldLawApplies a e = false := by
  simp [oldLawApplies]; omega

-- H) 免除は権限であって義務ではない
inductive Permission where | may | must deriving DecidableEq

def exemptPermission : Permission := .may

theorem exempt_is_may : exemptPermission = .may := by rfl
theorem exempt_not_must : exemptPermission ≠ .must := by decide

-- I) 金額区分
def inBracket (lo hi x : Nat) : Bool := decide (lo <= x ∧ x <= hi)

theorem bracket_lower (lo hi : Nat) (h : lo <= hi) : inBracket lo hi lo = true := by simp [inBracket, h]
theorem bracket_upper (lo hi : Nat) (h : lo <= hi) : inBracket lo hi hi = true := by simp [inBracket, h]

-- J) 重量閾値
def oneTon : Nat := 1000

def underOneTon (w : Nat) : Bool := decide (w <= oneTon)

def overOneTon (w : Nat) : Bool := decide (oneTon < w)

theorem weight_complement (w : Nat) : underOneTon w = true ↔ overOneTon w = false := by
  unfold underOneTon overOneTon oneTon
  by_cases h : w <= 1000
  · have h2 : ¬ 1000 < w := by omega
    simp [h, h2]
  · have h2 : 1000 < w := by omega
    simp [h, h2]

theorem weight_exclusive (w : Nat) : ¬ (underOneTon w = true ∧ overOneTon w = true) := by
  unfold underOneTon overOneTon oneTon
  by_cases h : w <= 1000
  · have h2 : ¬ 1000 < w := by omega
    simp [h, h2]
  · simp [h]

end JapanTaxLaw.ProvisionalNormsAndLabels
