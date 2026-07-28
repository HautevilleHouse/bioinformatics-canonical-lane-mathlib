import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure PhylogeneticsPackage where
  distanceMatrix : Type
  treeTopology : Type
  likelihoodModel : Type
  treeReconstructionConsistent : Prop
  branchLengthEstimable : Prop
  likelihoodComputable : Prop

structure PhylogeneticsEvidence (P : PhylogeneticsPackage) where
  treeReconstructionConsistentClosed : P.treeReconstructionConsistent
  branchLengthEstimableClosed : P.branchLengthEstimable
  likelihoodComputableClosed : P.likelihoodComputable

def PhylogeneticsClosed (P : PhylogeneticsPackage) : Prop :=
  P.treeReconstructionConsistent ∧ P.branchLengthEstimable ∧ P.likelihoodComputable

theorem phylogenetics_closed_from_evidence (P : PhylogeneticsPackage) (E : PhylogeneticsEvidence P) :
    PhylogeneticsClosed P :=
  And.intro E.treeReconstructionConsistentClosed (And.intro E.branchLengthEstimableClosed E.likelihoodComputableClosed)

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
