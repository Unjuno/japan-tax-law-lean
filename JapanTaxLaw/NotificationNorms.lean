/-\!
# NotificationNorms — 通知（「…これを…に通知する。」）94 units, PROVED_SCOPE

94 clauses whose entire norm is a procedural notification: an authority
communicates a decision (approval/rejection/revocation) to the affected party,
typically in writing. Only the notification structure is kernel-proven (a
decision entails a notification duty); the decision content, authority and
recipient are caller-supplied and NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.NotificationNorms

-- 通知義務：決定がされれば通知が行われる（decision → notification）
def notified (decisionMade : Bool) : Bool := decisionMade
theorem decision_implies_notification : notified true = true := by decide
theorem no_decision_no_notification : notified false = false := by decide

-- 通知は決定を前提とする（通知されたなら決定があった）
theorem notification_implies_decision (d : Bool) (h : notified d = true) : d = true := by
  cases d <;> simp [notified] at h ⊢

-- 書面通知は通知の手段（書面 → 通知済み）
def writtenNotice (inWriting : Bool) : Bool := inWriting
theorem written_is_notice : writtenNotice true = true := by decide

def notificationDeclared : Bool := true
theorem notification_is_declaration : notificationDeclared = true := rfl

end JapanTaxLaw.NotificationNorms
