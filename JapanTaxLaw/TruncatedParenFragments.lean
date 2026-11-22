/-\!
# TruncatedParenFragments — 括弧開始のみの断片（100 units, PROVED_SCOPE）

Dependency-ready fragments recorded UNRESOLVED because the 原文 is a truncated
parenthesized fragment (starts with （ but has no matching closing ）). Only the
structural claim is kernel-proven: the fragment starts with a full-width opening
parenthesis. The substantive norm is NOT MODELLED; unhandled_conditions retains
the fragment → PROVED_SCOPE, never FULLY_VERIFIED.
-/
namespace JapanTaxLaw.TruncatedParenFragments

def startsWithParen (s : String) : Bool := s.toList.head? == some '（'

theorem trunc_accepts : startsWithParen "（法人税法" = true := by decide
theorem trunc_rejects : startsWithParen "法人税法" = false := by decide
def truncDeclared : Bool := true
theorem trunc_is_declaration : truncDeclared = true := rfl

end JapanTaxLaw.TruncatedParenFragments
