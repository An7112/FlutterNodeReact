import React, { Component } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import Create from './create.component';
import Index from './index.component';
import Edit from './edit.component';
import CreateDocument from './create.document';
import IndexDocument from './index.document';
import EditDocument from './edit.document';
class Notifications extends Component {
    render () {
        return (
            <Router>
                <div className="container">
                    <nav className="navbar navbar-expand-lg navbar-light bg-light">
                        <div className="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul className="navbar-nav mr-auto">
                                <li className="nav-item">
                                    <Link to={'/createDocument'} className="nav-link">Create Document</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/indexDocument'} className="nav-link">Index Document</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/index'} className="nav-link">Index</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/create'} className="nav-link">Create</Link>
                                </li>
                            </ul>
                        </div>
                    </nav> <br/>
                    <h2>Create Notifications</h2> <br/>
                    <Switch>
                        <Route exact path='/create' component={ Create } />
                        <Route path='/edit/:id' component={ Edit }/>
                        <Route path='/index' component={ Index }/>
                        <Route exact path='/createDocument' component={ CreateDocument } />
                        <Route path='/editDocument/:id' component={ EditDocument }/>
                        <Route path='/indexDocument' component={ IndexDocument}/>
                    </Switch>
                </div>
            </Router>
        );
    }
}

export default Notifications;