/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
CKEDITOR.editorConfig = function( config ) {
 // Define changes to default configuration here. For example:
    config.language = 'ko';
    config.uiColor = '#FCE4C5';
    config.font_names = '���� ���; ����; ����; ����; �ü�; Nanum Gothic Coding; Quattrocento Sans;' + CKEDITOR.config.font_names; 
    config.height = '400px';  //Editor ����  
    config.width = '100%';
    config.enterMode =CKEDITOR.ENTER_BR;
    config.toolbarCanCollapse = true;
    config.docType = "<!DOCTYPE html>";
    config.filebrowserUploadUrl = '/upload/upload.php';
    config.removePlugins = 'save';
};

