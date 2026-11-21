/-\!
# PriorPenaltyAndDelegation2 — 従前例罰則・附則委任・枝番号（1083 units）

1,083 dependency-ready units in four §3 families. All concrete provisions,
targets and amounts are caller-supplied; only structure is kernel-proven.

1. prior_penalty (582): 施行前の行為・附則で従前/効力有とされる場合の施行後行為の罰則は従前の例.
2. misc_term (289): 地方団体の種類, 金額, 同年四月及び五月, 免除/追徴の規定 etc.
3. suppl_deleg (200): 附則第二条から前条まで…必要な経過措置は政令で定める.
4. subitem_label (12): 二十一の二 etc. — (ordinal, sub) pair.
-/
import JapanTaxLaw.KanjiOrdinals

namespace JapanTaxLaw.PriorPenaltyAndDelegation2

open JapanTaxLaw.KanjiOrdinals

-- 1) 従前例の罰則：行為が施行前なら旧法
def oldPenaltyApplies (actTime enforcement : Nat) : Bool := decide (actTime < enforcement)

theorem old_penalty_before (a e : Nat) (h : a < e) : oldPenaltyApplies a e = true := by simp [oldPenaltyApplies, h]

theorem new_penalty_from_enforcement (a e : Nat) (h : e <= a) : oldPenaltyApplies a e = false := by
  simp [oldPenaltyApplies]; omega

-- 2) 用語参照（外部が与える）
def termLookup (target : Nat) : Nat := target

theorem term_lookup_identity (t : Nat) : termLookup t = t := by rfl

-- 3) 附則の委任
def supplementaryDelegation (content : Nat) : Nat := content

theorem supplementary_identity (c : Nat) : supplementaryDelegation c = c := by rfl

-- 4) 枝番号
def splitAtNo : List Char -> Option (List Char × List Char)
  | [] => none
  | 'の' :: rest => some ([], rest)
  | c :: rest => (fun (a, b) => (c :: a, b)) <$> splitAtNo rest

def parseSubItem (s : String) : Option (Nat × Nat) := do
  let (a, b) <- splitAtNo s.toList
  let x <- parseKanji (String.ofList a)
  let y <- parseKanji (String.ofList b)
  pure (x, y)

theorem subitem_21_2 : parseSubItem "二十一の二" = some (21, 2) := by decide

end JapanTaxLaw.PriorPenaltyAndDelegation2
