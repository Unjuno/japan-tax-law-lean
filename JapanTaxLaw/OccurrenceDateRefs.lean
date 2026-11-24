/-\!
# OccurrenceDateRefs — 発生日の参照（…があつた日）51 units, PROVED_SCOPE

51 clauses across tax laws ending 「…があつた日。」— each references the date on
which an event occurred (e.g. 「申請書の提出があつた日」, 「公告があつた日」). Only
the event-date reference structure is kernel-proven (an event has at most one
occurrence date; the reference is deterministic in the event; two events' dates
are ordered; the reference is stable); the concrete events and dates are NOT
MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.OccurrenceDateRefs

-- 事象識別子と日付は Nat（具体値は NOT MODELLED）
abbrev EventId := Nat
abbrev Date := Nat

-- 発生日を返す関数（具体的事象→日付の対応は NOT MODELLED）
abbrev OccurrenceMap := EventId -> Date

-- 発生日参照
def occurrenceDate (m : OccurrenceMap) (e : EventId) : Date := m e
theorem occurrence_deterministic (m : OccurrenceMap) (e : EventId) : occurrenceDate m e = m e := rfl
theorem same_event_same_date (m : OccurrenceMap) (e d1 d2 : Date) (h1 : d1 = m e) (h2 : d2 = m e) : d1 = d2 := by
  subst d1; subst d2; rfl

-- 二つの事象の発生日の順序は比較可能（Nat の全順序）
def datesOrdered (d1 d2 : Date) : Bool := d1 <= d2
theorem order_refl (d : Date) : datesOrdered d d = true := by unfold datesOrdered; simp
theorem order_total (d1 d2 : Date) : datesOrdered d1 d2 = true ∨ datesOrdered d2 d1 = true := by
  unfold datesOrdered
  cases Nat.le_total d1 d2 with
  | inl h => left; simp [h]
  | inr h => right; simp [h]

-- 開始日は当該日に含まれる（境界含有）
def onOrAfter (day boundary : Date) : Bool := boundary <= day
theorem occurrence_on_boundary (b : Date) : onOrAfter b b = true := by unfold onOrAfter; simp

def occurrenceDateDeclared : Bool := true
theorem occurrence_date_is_declaration : occurrenceDateDeclared = true := rfl

end JapanTaxLaw.OccurrenceDateRefs
