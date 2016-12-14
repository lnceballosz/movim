<ul class="list">
    <li class="subheader">
        <p>Roles</p>
    </li>
    {loop="$affiliations"}
        {$contact = $c->getContact($value[0])}
        {$role = $value[1]}
        <li>
            {$url = $contact->getPhoto('m')}
            {if="$url"}
                <span class="primary icon bubble"
                    style="background-image: url({$url});">
                </span>
            {else}
                <span class="primary icon bubble color {$contact->jid|stringToColor}">
                    {$contact->getTrueName()|firstLetterCapitalize}
                </span>
            {/if}
            <form name="{$contact->jid}">
                <input type="hidden" name="jid" value="{$contact->jid}"/>
                <div>
                    {if="$role == 'owner' && $contact->jid == $me"}
                        <input type="text" disabled value="{$c->__('communityaffiliation.owner')}"/>
                    {else}
                    <div class="select">
                        <select name="role" id="role" onchange="CommunityAffiliations.update('{$contact->jid}')">
                            {loop="$roles"}
                                {if="$value == $role"}
                                    <option
                                        value="{$value}"
                                        selected="selected">
                                        {$value}
                                    </option>
                                {else}
                                    <option value="{$value}">
                                        {$value}
                                    </option>
                                {/if}
                            {/loop}
                        </select>
                    </div>
                    {/if}
                    <label for="role">{$contact->getTrueName()} role</label>
                </div>
            </form>
        </li>
    {/loop}
    <li class="subheader">
        <p>{$c->__('button.add')}</p>
    </li>
    <li>
        <span class="primary icon gray">
            <i class="zmdi zmdi-plus"></i>
        </span>
        <form name="addaffiliation">
            <div>
                <datalist id="jid_list" style="display: none;">
                    {if="is_array($subscriptions)"}
                        {loop="$subscriptions"}
                            <option value="{$value->jid}"/>
                        {/loop}
                    {/if}
                </datalist>
                <input type="text" list="jid_list" name="jid" placeholder="user@server.tld"/>
                <label for="jid">Jabber ID</label>
            </div>
            <div>
                <div class="select">
                    <select name="role" id="role" onchange="CommunityAffiliations.update('addaffiliation')">
                        {loop="$roles"}
                            {if="$value == 'none'"}
                                <option
                                    value="{$value}"
                                    selected="selected">
                                    {$value}
                                </option>
                            {else}
                                <option value="{$value}">
                                    {$value}
                                </option>
                            {/if}
                        {/loop}
                    </select>
                </div>
                <label for="role">Role</label>
            </div>
        </form>
    </li>
</ul>