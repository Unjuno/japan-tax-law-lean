/-\!
# CertificateAndRateNormsSpec — 独立形式仕様

pinned 原文（証明書・書類提出・税率上限 911条片）から独立に読み取った仕様。実装を import しない。

証明書保持は呼出側が与える真偽値。書類提出は date<=deadline。期限延長は deadline+extension。
税率上限は rate<=cap。具体的な書類・税率は NOT MODELLED。
-/
namespace JapanTaxLaw.CertificateAndRateNormsSpec

def certificateSpec (h : Bool) : Bool := h
def submitSpec (d dl : Nat) : Prop := d <= dl
def extendSpec (d e : Nat) : Nat := d + e
def capSpec (r c : Nat) : Prop := r <= c

end JapanTaxLaw.CertificateAndRateNormsSpec
