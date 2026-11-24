import JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays

/-
# CertificationIssuanceDeadlineFifteenDaysSpec — independent spec for 特定国等証明書発給省令 art.2(4)（十五日以内）

Pinned source:
  Law id: 508M60000400060
  Revision: 508M60000400060_20261031_508M60000400078
  Statutory article: 第二条(4)
  原文逐語: 「第一項の規定による証明書の交付は、交付申請を経済産業大臣が受理した日から十五日以内にするものとする。」
  Normative unit: NORM|e3f96720f013bcbb5689c22af36d821a4342cd90bcb9a667f1bd983a7e93bbe1

This module carries its OWN statutory constant. 以内 is expressed as the
negation of the strict opposite order, `decide (¬ cap < days)` — a different
operator from the impl's `<=`. It reuses NO implementation definition in its
`spec*` defs; the universal `agree_issuance_deadline` theorem is the only
bridge, and the kernel checks it for every Nat day count by structural
recursion (axiom-free).

Not modelled: the application requirements, the accepting authority, other
paragraphs and enforcement rules.
-/

namespace JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays

/-- Spec-local statutory value: 十五日 = 15 days. Independent of impl. -/
def specDeadlineDays : Nat := 15

/-- Independent formula: 以内 as `¬ cap < days`. Uses `<`, not `<=`. -/
def specWithinDeadline (days : Nat) : Bool :=
  decide (¬ specDeadlineDays < days)

-- Spec-local sanity example (test scaffolding; excluded from statutory literals).
example : specDeadlineDays = 15 := rfl

/-- Universal, kernel-checked, axiom-free agreement for every Nat day count. -/
theorem agree_issuance_deadline : ∀ days : Nat,
    withinIssuanceDeadline days = specWithinDeadline days
  | 0 => by decide
  | Nat.succ (0) => by decide
  | Nat.succ (Nat.succ (0)) => by decide
  | Nat.succ (Nat.succ (Nat.succ (0))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0)))))))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (0))))))))))))))) => by decide
  | Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (Nat.succ (k)))))))))))))))) => by
      unfold withinIssuanceDeadline issuanceDeadlineDays specWithinDeadline specDeadlineDays
      rfl

/-- Finite spec-local grid (Bool scaffolding); universal theorem is the proof. -/
def specDeadlineGrid : Bool :=
  [0, 14, 15, 16].all fun days =>
    specWithinDeadline days == decide (days <= 15)

example : specDeadlineGrid = true := by decide

end JapanTaxLaw.CertificationIssuanceDeadlineFifteenDays
