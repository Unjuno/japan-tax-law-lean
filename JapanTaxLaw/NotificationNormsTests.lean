import JapanTaxLaw.NotificationNorms
import JapanTaxLaw.NotificationNormsSpec

/-!
# NotificationNormsTests — 通知
-/
namespace JapanTaxLaw.NotificationNormsTests
open JapanTaxLaw.NotificationNorms

theorem notified_spec (d : Bool) : notified d = JapanTaxLaw.NotificationNormsSpec.notifiedSpec d := by rfl
theorem written_spec (w : Bool) : writtenNotice w = JapanTaxLaw.NotificationNormsSpec.writtenNoticeSpec w := by rfl
example : notified true = true := decision_implies_notification
example : notified false = false := no_decision_no_notification
example (d : Bool) (h : notified d = true) : d = true := notification_implies_decision d h
example : writtenNotice true = true := written_is_notice
example : notificationDeclared = true := notification_is_declaration

end JapanTaxLaw.NotificationNormsTests
