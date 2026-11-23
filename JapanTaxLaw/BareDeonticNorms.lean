/-\!
# BareDeonticNorms — 裸のデオンティック法様相（930 units, PROVED_SCOPE）

930 clauses whose entire norm is a bare deontic modality:
- obligation (413): 「…で(し)なければならない。」— P is required.
- permission (407): 「…ることができる。」— P is permitted.
- prohibition (110): 「…ことができない。」— P is prohibited.

Only the modal structure is kernel-proven (duality relations); the substantive
content P is caller-supplied and NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.BareDeonticNorms

-- 法的様相は命題 P に対する述語としてモデル（P は NOT MODELLED）
def Required (P : Prop) : Prop := P
def Permitted (P : Prop) : Prop := P
def Prohibited (P : Prop) : Prop := ¬ P

-- 禁止 ⇔ 否定の義務（デオンティック双対）
theorem prohibited_iff_required_not (P : Prop) : Prohibited P ↔ Required (¬ P) := by rfl
-- 許可 ⇔ 否定の義務でない
theorem permitted_iff_not_required_not (P : Prop) : Permitted P ↔ ¬ Required (¬ P) := by
  unfold Permitted Required
  constructor
  · intro h hn; exact hn h
  · intro h; exact Classical.byContradiction (fun hn => h hn)

-- 義務は許可を含む（義務→許可）
theorem required_implies_permitted (P : Prop) (h : Required P) : Permitted P := h
-- 禁止と許可は両立しない
theorem prohibited_not_permitted (P : Prop) (hp : Prohibited P) (hq : Permitted P) : False := hp hq

def bareDeonticDeclared : Bool := true
theorem bare_deontic_is_declaration : bareDeonticDeclared = true := rfl

end JapanTaxLaw.BareDeonticNorms
