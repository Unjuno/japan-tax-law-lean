/-\!
# TreatyJPUSDefinitions — 日米租税条約 第三条（定義の集合演算）L3

Formalization of the self-contained set operators in Article 3 definitions of
the Japan–US income tax treaty (pinned SHA-verified parsed MOF text):

  (e) 「者」には、個人、法人及び法人以外の団体を含む。
  (b) 合衆国には、プエルトリコ、バージン諸島、グアムその他の属地又は準州を
      含まない。

L3_TREATY auxiliary layer — NOT merged into L0. Concrete categories are
caller-supplied and NOT MODELLED. Human legal review pending.
-/
namespace JapanTaxLaw.TreatyJPUSDefinitions

inductive PersonCat where | individual | corporation | otherBody deriving DecidableEq

-- 「者」 = 個人・法人・法人以外の団体のいずれか
def isPerson (c : PersonCat) : Bool := true

theorem individual_is_person : isPerson PersonCat.individual = true := rfl
theorem corporation_is_person : isPerson PersonCat.corporation = true := rfl
theorem otherBody_is_person : isPerson PersonCat.otherBody = true := rfl

-- 合衆国の地理的範囲：属地・準州は含まない（集合差）
def inUS (territory : Nat) (excluded : List Nat) : Bool := ! excluded.contains territory

theorem territory_excluded (t : Nat) (xs : List Nat) : inUS t (t :: xs) = false := by simp [inUS]
theorem territory_included (t : Nat) (xs : List Nat) (h : t ∉ xs) : inUS t xs = true := by
  simp [inUS, h]

def definitionsDeclared : Bool := true
theorem definitions_is_declaration : definitionsDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDefinitions
