<?php

/**
 *  2Moons
 *  Copyright (C) 2012 Jan Kröpke
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @package 2Moons
 * @author Jan Kröpke <info@2moons.cc>
 * @copyright 2012 Jan Kröpke <info@2moons.cc>
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.7.3 (2013-05-19)
 * @info $Id: BBCode.php 2640 2013-03-23 19:23:26Z slaver7 $
 * @link http://2moons.cc/
 */

function bbcode($text) {
	require_once('includes/classes/class.BBCode.php');
	$bbcode = new BBCode();

	$bbcode->addParser ('list', 'bbcode_stripcontents');

	//Block-Elements
	$bbcode->addCode("quote", "callback_replace", "bbcode_quote", array(), "block", array("block"), array('inline','link','list'));
	$bbcode->addCode("align", "callback_replace", "bbcode_align", array(), "block", array("block"), array('inline','link','list'));
	$bbcode->addCode("spoiler", "simple_replace", null, array('start_tag'=>'<div class="bbcode_spoiler"><p><b>Spoiler:</b></p><div>', 'end_tag'=>'</div></div>'), "block", array("block"), array('inline','link','list'));
	$bbcode->addCode("bg", "usecontent?", "bbcode_background", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));
	$bbcode->addCode("bgcolor", "callback_replace", "bbcode_bgcolor", array(), 'inline', array('block','inline','link','listitem'), array());
	
	//Inline-Elements
	$bbcode->addCode("b", "simple_replace", null, array('start_tag'=>'<b>', 'end_tag'=>'</b>'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("i", "simple_replace", null, array('start_tag'=>'<i>', 'end_tag'=>'</i>'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("u", "simple_replace", null, array('start_tag'=>'<u>', 'end_tag'=>'</u>'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("s", "simple_replace", null, array('start_tag'=>'<s>', 'end_tag'=>'</s>'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("size", "callback_replace", "bbcode_size", array(), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("color", "callback_replace", "bbcode_color", array(), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("rouge", "callback_replace", "bbcode_rouge", array('start_tag'=>'[rouge]', 'end_tag'=>'[/rouge]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("orange", "callback_replace", "bbcode_orange", array('start_tag'=>'[orange]', 'end_tag'=>'[/orange]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("jaune", "callback_replace", "bbcode_jaune", array('start_tag'=>'[jaune]', 'end_tag'=>'[/jaune]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("chartreuse", "callback_replace", "bbcode_chartreuse", array('start_tag'=>'[chartreuse]', 'end_tag'=>'[/chartreuse]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("vert", "callback_replace", "bbcode_vert", array('start_tag'=>'[vert]', 'end_tag'=>'[/vert]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("cyan", "callback_replace", "bbcode_cyan", array('start_tag'=>'[cyan]', 'end_tag'=>'[/cyan]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("bleu", "callback_replace", "bbcode_bleu", array('start_tag'=>'[bleu]', 'end_tag'=>'[/bleu]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("violet", "callback_replace", "bbcode_violet", array('start_tag'=>'[violet]', 'end_tag'=>'[/violet]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("rose", "callback_replace", "bbcode_rose", array('start_tag'=>'[rose]', 'end_tag'=>'[/rose]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("gris", "callback_replace", "bbcode_gris", array('start_tag'=>'[gris]', 'end_tag'=>'[/gris]'), 'inline', array('block','inline','link','listitem'), array());
	$bbcode->addCode("blanc", "callback_replace", "bbcode_blanc", array('start_tag'=>'[blanc]', 'end_tag'=>'[/blanc]'), 'inline', array('block','inline','link','listitem'), array());
	//Link-Elements
	$bbcode->addCode("url", "usecontent?", "bbcode_url", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));
	$bbcode->addCode("link", "usecontent?", "bbcode_url", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));
	$bbcode->addCode("mailto", "usecontent?", "bbcode_mailto", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));
	$bbcode->addCode("email", "usecontent?", "bbcode_mailto", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));
	$bbcode->addCode("mail", "usecontent?", "bbcode_mailto", array('usecontent_param'=>'default'), 'link', array('block','inline','listitem'), array('link'));

	//Code-Elements
	$bbcode->addCode("code", "usecontent", "bbcode_code", array('php'=>false), 'code', array('block'), array('inline','link','list'));
	$bbcode->addCode("php", "usecontent", "bbcode_code", array('php'=>true), 'code', array('block'), array('inline','link','list'));

	//List-Elements
	$bbcode->addCode("list", "callback_replace", "bbcode_list", array(), "list", array('block', 'listitem'), array('inline', 'link'));
	$bbcode->addCode("*", "simple_replace", null, array('start_tag'=>'<li>', 'end_tag'=>'</li>'), "listitem", array('list'), array());

	//Image-Element
	$bbcode->addCode("img", "usecontent", "bbcode_img", array(), "image", array('block','inline','link','listitem'), array());

	//Flags
	$bbcode->setCodeFlag('*', 'closetag', BBCODE_CLOSETAG_OPTIONAL);
	$bbcode->setGlobalCaseSensitive (false);

	//New-Line-Drops
	$bbcode->setCodeFlag('*', 'closetag.before.newline', BBCODE_NEWLINE_DROP);
	$bbcode->setCodeFlag ('list', 'opentag.before.newline', BBCODE_NEWLINE_DROP);
	$bbcode->setCodeFlag ('list', 'closetag.before.newline', BBCODE_NEWLINE_DROP);
	$codes = array('code', 'php', 'quote', 'spoiler');
	$flags = array('opentag.before.newline', 'opentag.after.newline', 'closetag.before.newline', 'closetag.after.newline');
	foreach ($codes as $code) {
		foreach ($flags as $flag) {
			$bbcode->setCodeFlag ($code, $flag, BBCODE_NEWLINE_DROP);
		}
	}


	return str_replace('&amp;amp;', '&amp;', makebr($bbcode->parse($text)));
}

function convertlinebreaks ($text) {
	return preg_replace ("/\015\012|\015|\012/", "\n", $text);
}

function bbcode_stripcontents ($text) {
	return preg_replace ("/[^\n]/", '', $text);
}

function bbcode_align($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') {
		if (!isset($attributes["default"])) return false;
		$allowed = array("left", "right", "center", "justify");
		if (in_array($attributes["default"], $allowed)) return true;
		return false;
	}
	return '<div style="text-align: '.$attributes["default"].'">'.$content.'</div>';
}

function bbcode_quote($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	$return = "<div class='bbcode_quote'><p>Zitat";
	if (isset($attributes['default'])) {
		$return .= " von ";
		$USER = $GLOBALS['user']->getUserIdByName($attributes['default']);
		if (!empty($USER)) {
			$pageid = $GLOBALS['page']->getPageIdByFile('userlist');
			$return .= "<a href='?page=$pageid&amp;id=$USER'>";
			$return .= htmlentities($attributes['default']) . "</a>";
		}
		else {
			$return .= "<b>".htmlentities($attributes['default'])."</b>";
		}
	}
	$return .= ":</p><div>".$content."</div></div>";
	return $return;
}

function bbcode_url ($action, $attributes, $content, $params, $node_object) {
    if (!isset ($attributes['default'])) {
        $url = $content;
        $text = htmlspecialchars ($content);
    } else {
        $url = $attributes['default'];
        $text = $content;
    }
    if ($action == 'validate') {
        if (substr ($url, 0, 5) == 'data:' || substr ($url, 0, 5) == 'file:' || substr ($url, 0, 11) == 'javascript:' || substr ($url, 0, 4) == 'jar:' || substr ($url, 0, 1) == '#') {
            return false;
        }
        return true;
    }
    return '<a href="'.htmlspecialchars($url).'">'.$text.'</a>';
}
function bbcode_mailto ($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	if (!isset ($attributes['default'])) {
		return '<a href="mailto:'.$content.'">'.$content.'</a>';
	}
	return '<a href="mailto:'.htmlspecialchars($attributes['default']).'">'.$content.'</a>';
}

function bbcode_code($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	if ($params["php"]) {
		$content = highlight_string(html_entity_decode($content), true);
	}
	$return =  '<div class="bbcode_code';
	if ($params["php"]) $return .= "_php";
	$return .= '"><p><b>Code:</b></p><div>'.$content."</div></div>";
	return $return;
}

function bbcode_img ($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<img src="'.htmlentities($content).'" alt="" border="">';
}

function bbcode_background($action, $attributes, $content, $params, $node_object) {
    if (!isset ($attributes['default'])) {
        $url = $content;
        $text = htmlspecialchars($content);
    } else {
        $url = $attributes['default'];
        $text = $content;
    }
    if ($action == 'validate') {
        if (substr ($url, 0, 7) == 'http://') {
            return true;
        }
        return false;
    }
    return '<div style="background: url('.htmlspecialchars($url).');">'.$text.'</div>';
}

function bbcode_list ($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') {
		if (isset($attributes['default'])) {
			return preg_match('|^[0-9]+$|', $attributes['default']);
		}
		return true;
	}
	$bbcode = isset($attributes['default']) ? "<ol start=\"".$attributes['default']."\">".$content."</ol>" : "<ul>".$content."</ul>";
	return $bbcode;
}


function bbcode_size($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') {
		if (!is_numeric($attributes["default"])) return false;
		if ($attributes["default"] <= 36 && $attributes["default"] >= 4) return true;
		return false;
	}
	return '<span style="font-size: '.htmlspecialchars($attributes["default"]).'px">'.$content.'</span>';
}

function bbcode_color($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span style="color: '.htmlspecialchars($attributes["default"]).'">'.$content.'</span>';
}

function bbcode_rouge($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="rouge">'.$content.'</span>';
}
function bbcode_orange($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="orange">'.$content.'</span>';
}
function bbcode_jaune($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="jaune">'.$content.'</span>';
}
function bbcode_chartreuse($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="chartreuse">'.$content.'</span>';
}
function bbcode_vert($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="vert">'.$content.'</span>';
}
function bbcode_cyan($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="cyan">'.$content.'</span>';
}
function bbcode_bleu($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="bleu">'.$content.'</span>';
}
function bbcode_violet($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="violet">'.$content.'</span>';
}
function bbcode_rose($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="rose">'.$content.'</span>';
}
function bbcode_gris($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="gris">'.$content.'</span>';
}
function bbcode_blanc($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span class="blanc">'.$content.'</span>';
}

function bbcode_bgcolor($action, $attributes, $content, $params, $node_object) {
	if ($action == 'validate') return true;
	return '<span style="background: '.htmlspecialchars($attributes["default"]).'">'.$content.'</span>';
}