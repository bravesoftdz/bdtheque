<?php

namespace BDTheque\DataModelBundle\Utils;

use BDTheque\DataModelBundle\Entity\Serie;
use BDTheque\DataModelBundle\Entity\Editeur;
use BDTheque\DataModelBundle\Entity\Collection;

/**
 * Generated by PHPUnit_SkeletonGenerator 1.2.0 on 2012-11-20 at 09:58:29.
 */
class StringUtilsTest extends \PHPUnit_Framework_TestCase {

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp() {
        
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
        
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::stripAccents
     */
    public function testStripAccents() {
        $chaine = 'àçèéêëîïùûüÀÇÈÉÊËÎÏÙÛÜ';
        $this->assertEquals('aceeeeiiuuuACEEEEIIUUU', StringUtils::stripAccents($chaine));
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::extractInitialeFromString
     */
    public function testExtractInitialeFromString() {
        $this->assertEquals('#', StringUtils::extractInitialeFromString("6521dsf"));
        $this->assertEquals('F', StringUtils::extractInitialeFromString("f521dsf"));
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::formatTitre
     */
    public function testFormatTitre() {
        $this->assertEquals('Trolls de Troy', StringUtils::formatTitre('Trolls de Troy'));
        $this->assertEquals('Le Scorpion', StringUtils::formatTitre('Scorpion [Le]'));
        $this->assertEquals('L\'Etape', StringUtils::formatTitre('Etape [L\']'));
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::ajoutString
     */
    public function testAjoutString() {
        $chaine = '';
        StringUtils::ajoutString($chaine, 'ajout', 'espace');
        $this->assertEquals('ajout', $chaine);

        $chaine = 'chaine';
        StringUtils::ajoutString($chaine, 'ajout', 'espace');
        $this->assertEquals('chaineespaceajout', $chaine);

        $chaine = 'chaine';
        StringUtils::ajoutString($chaine, '', 'espace');
        $this->assertEquals('chaine', $chaine);

        $chaine = 'chaine';
        StringUtils::ajoutString($chaine, 'ajout', 'espace', 'avant', 'apres');
        $this->assertEquals('chaineespaceavantajoutapres', $chaine);

        $chaine = 'chaine';
        StringUtils::ajoutString($chaine, '', 'espace', 'avant', 'apres');
        $this->assertEquals('chaine', $chaine);
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::formatISBN
     */
    public function testFormatISBN() {
        $this->assertEquals('978-0-7777-7777-0', StringUtils::formatISBN('9780777777770'));
        $this->assertEquals('978-952-89-8888-5', StringUtils::formatISBN('9789528988885'));
        $this->assertEquals('978-2-921548-21-2', StringUtils::formatISBN('9782921548212'));
        $this->assertEquals('2-921548-21-6', StringUtils::formatISBN('2921548216'));
    }

    /**
     * @covers BDTheque\DataModelBundle\Utils\StringUtils::displayTitreSerie
     */
    public function testDisplayTitreSerie() {
        $serie = new Serie();
        $editeur = new Editeur();
        $collection = new Collection();

        $serie->setEditeur($editeur);
        $serie->setCollection($collection);

        $serie->setTitre('Serie [La]');
        $editeur->setNomEditeur('Editeur [L\']');
        $collection->setNomCollection('Collection [La]');

        $this->assertEquals('Serie [La] (L\'Editeur - La Collection)', StringUtils::displayTitreSerie($serie, true));
        $this->assertEquals('La Serie (L\'Editeur - La Collection)', StringUtils::displayTitreSerie($serie));
    }

}
