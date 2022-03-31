import React, { Component } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import Create from './create.component';
import Index from './index.component';
import Edit from './edit.component';
import CreateDocument from './create.document';
import IndexDocument from './index.document';
import EditDocument from './edit.document';
import CreateStudent from './create.student';
import EditStudent from './edit.student';
import IndexStudent from './index.student';
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
                                    <Link to={'/indexDocument'} className="nav-link">Document</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/index'} className="nav-link">Index</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/create'} className="nav-link">Create</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/createStudent'} className="nav-link">Create Student</Link>
                                </li>
                                <li className="nav-item">
                                    <Link to={'/indexStudent'} className="nav-link">Student</Link>
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
                        <Route path='/editdocument/:id' component={ EditDocument }/>
                        <Route path='/indexDocument' component={ IndexDocument}/>

                        <Route exact path='/createStudent' component={ CreateStudent } />
                        <Route path='/editstudent/:id' component={ EditStudent }/>
                        <Route path='/indexStudent' component={ IndexStudent}/>
                    </Switch>
                </div>
            </Router>
        );
    }
}

export default Notifications;