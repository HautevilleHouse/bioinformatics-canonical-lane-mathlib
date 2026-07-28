import BioinformaticsCanonicalLaneLean.BioinformaticsSequenceAlignment

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure PhylogeneticTreePackage (S : SequenceAlignmentPackage) where
  treeTopology : Type
  branchLengths : Prop
  evolutionaryModel : Prop
  bootstrapSupport : Prop

structure PhylogeneticTreeEvidence {S : SequenceAlignmentPackage} (P : PhylogeneticTreePackage S) where
  treeTopologyClosed : P.treeTopology
  branchLengthsClosed : P.branchLengths
  evolutionaryModelClosed : P.evolutionaryModel
  bootstrapSupportClosed : P.bootstrapSupport

def PhylogeneticTreeClosed {S : SequenceAlignmentPackage} (P : PhylogeneticTreePackage S) : Prop :=
  P.treeTopology ∧ P.branchLengths ∧ P.evolutionaryModel ∧ P.bootstrapSupport

theorem phylogenetic_tree_closed_from_evidence
    {S : SequenceAlignmentPackage} (P : PhylogeneticTreePackage S)
    (E : PhylogeneticTreeEvidence P) : PhylogeneticTreeClosed P := by
  exact And.intro E.treeTopologyClosed
    (And.intro E.branchLengthsClosed
      (And.intro E.evolutionaryModelClosed E.bootstrapSupportClosed))

end BioinformaticsCanonicalLaneLean
end HautevilleHouse