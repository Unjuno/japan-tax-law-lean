import Std
import JapanTaxLaw.TaxFinance

/-
# CertificateIssueWithinFifteenDaysFromAcceptance — 電解二酸化マンガン証明書発給省令 第二条 第四項
（申請を受理した日から十五日以内に証明書の交付をする）

Pinned sources:
  Law id: 420M60000400040 (電解二酸化マンガンに対して課する不当廉売関税に
    関する政令第一条第一項第一号に規定する電気分解の工程を経て製造した
    二酸化マンガンでない旨の証明書の発給に関する省令)
  Revision: 420M60000400040_20240301_506M60000400008 (enforced 2024-03-01)
  Raw snapshot: data/raw/420M60000400040_20240301_506M60000400008.law.json
  Article 2, Paragraph 4, ParagraphSentence, Sentence 1.
  Normative unit: NORM|b4e2b8e21314be77afac49475fad6065b8d4e9228cb3b42bddd2728be5b2dc5b

Verbatim 原文 needle (scoped main Article 2):
  「第一項の規定による証明書の交付は、同項の申請を経済産業大臣が受理した日から十五日以内にするものとする。」

Variable contract (day indices; caller establishes the calendar convention):
  acceptDay = 経済産業大臣が申請を受理した日
  issueDay  = 証明書を交付した日
  dayLimit  = 十五 = 15
  within15 acceptDay issueDay =
      acceptDay <= issueDay && issueDay - acceptDay <= dayLimit

The explicit `acceptDay <= issueDay` guard is essential: Nat subtraction is
zero-saturating, so without it a pre-acceptance issueDay would wrongly pass.

Out of scope: whether acceptance counts as day 0 or day 1 (初日不算入),
calendar/leap/weekend rules, extensions, paragraph 1's substantive finding,
paragraphs 2–3, the supplementary article 2, and other laws' deadlines.
Caveat: the 15-day deadline family overlaps older modules
(`CertificationIssuanceDeadlineFifteenDays`, `IssuanceDeadlineFifteenElapsedDays`);
this is a distinct law/revision/cell pin with the explicit guard, not a novelty
claim. No human legal review; LEGAL_REVIEW_PENDING.
-/

namespace JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance

/-- 原文の「十五」= 15（日）。 -/
def dayLimit : Nat := 15

/-- 受理日から十五日以内（受理前は不許、上限 inclusive）。 -/
def within15 (acceptDay issueDay : Nat) : Bool :=
  acceptDay <= issueDay && issueDay - acceptDay <= dayLimit

theorem limit_is_15 : dayLimit = 15 := rfl

-- 境界: 0..15 true、16 false
theorem same_day : within15 0 0 = true := by decide
theorem at_limit : within15 0 15 = true := by decide
theorem past_limit : within15 0 16 = false := by decide
theorem shifted_ok : within15 10 25 = true := by decide
theorem shifted_past : within15 10 26 = false := by decide

-- 重要: 受理前の交付は Nat 減算の saturation を防ぐガードで false
theorem before_acceptance : within15 10 9 = false := by decide

end JapanTaxLaw.CertificateIssueWithinFifteenDaysFromAcceptance
